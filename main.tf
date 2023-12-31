module "elb" {
  source = "./modules/elb"
  vpc = module.vpc.vpc
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr     = var.vpc_cidr
  vpc_subnet   = var.vpc_subnet
  route        = var.route
  sg           = var.sg
  sg_rule      = var.sg_rule
}

module "efs" {
  source = "./modules/efs"

  vpc = module.vpc.vpc
}

module "aurora" {
  source = "./modules/aurora"

  vpc = module.vpc.vpc
}

module "iam" {
  source = "./modules/iam"
}
module "web-server" {
  source = "./modules/web-server"

  vpc = module.vpc.vpc
  iam = module.iam.iam
  elb = module.elb.elb
}

module "lambda" {
  source = "./modules/lambda"

  role       = module.iam.iam.role_lambda

  depends_on = [
    module.iam
  ]
}

module "kinesis" {
  source = "./modules/kinesis"

  role       = module.iam.iam.role_firehose
  lambda     = module.lambda.lambda.transformation
  kinesis    = var.firehose

  depends_on = [
    module.iam
  ]
}

module "cloudwatch" {
  source = "./modules/cloudwatch"

  aurora       = module.aurora.aurora.cluster
  role         = module.iam.iam.role_cloudwatch_logs
  kinesis      = module.kinesis.kinesis.firehose
}
provider "aws" {
  region = "eu-west-1"
}


module "test_iam" {
  source = "../"
  principals = {
    Service = "eks.amazonaws.com"
  }

  name_iam_policy = "test_policy"
  name_iam_role   = "test_role"
  defined_policies = [
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  ]
}
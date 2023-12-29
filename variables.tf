# Region 
variable "region" {
  type = string
  default = "us-east-1"
}

# ECR Name
variable "ecr_name" {
  type = list(string)
  default = [ "demo", "demo2" ]
}

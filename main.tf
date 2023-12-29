# creating lifecycle policy for ECR
resource "aws_ecr_lifecycle_policy" "foopolicy" {
  count = length(var.ecr_name)
  repository = var.ecr_name[count.index]

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 14 days",
            "selection": {
                "tagStatus": "untagged",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 1
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}
resource "aws_iam_role" "dax" {
  name_prefix = "DAXServiceRoleForDynamoDBAccess"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "dax.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
  tags = var.common_tags
}
resource "aws_iam_role_policy" "dax" {
  # checkov:skip=CKV_AWS_290: Policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_355: Policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_272: Policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_356: Policy requires broad access for this module to function
  role = aws_iam_role.dax.name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "dynamodb:DescribeTable",
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem",
          "dynamodb:Query",
          "dynamodb:Scan",
          "dynamodb:BatchGetItem",
          "dynamodb:BatchWriteItem",
          "dynamodb:ConditionCheckItem"
        ],
        "Effect" : "Allow",
        "Resource" : [
          "arn:aws:dynamodb:us-west-2:${data.aws_caller_identity.current.account_id}:*"
        ]
      }
    ]
  })

}
data "aws_caller_identity" "current" {}

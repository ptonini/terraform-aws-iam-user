resource "aws_iam_user" "this" {
  name = var.username
  path = "/"
}

resource "aws_iam_access_key" "this" {
  count = var.access_key ? 1 : 0
  user  = aws_iam_user.this.name
}

resource "aws_iam_user_policy" "this" {
  user = aws_iam_user.this.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = concat(var.policy_statements, [for a in var.assume_role_arns : {
      Effect   = "Allow",
      Action   = ["sts:AssumeRole"],
      Resource = a
    }])
  })
}

resource "aws_iam_user_policy_attachment" "this" {
  for_each   = { for i, v in var.policy_arns : i => v }
  policy_arn = each.value
  user       = aws_iam_user.this.name
}


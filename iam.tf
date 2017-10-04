resource "aws_iam_instance_profile" "main" {
  name_prefix = "${format(
    "%s-%s-%s-%s-",
    var.project,
    var.environment,
    var.component,
    var.name
  )}"

  role = "${aws_iam_role.main.name}"
}

resource "aws_iam_role" "main" {
  name_prefix = "${format(
    "%s-%s-%s-%s-",
    var.project,
    var.environment,
    var.component,
    var.name
  )}"

  assume_role_policy = "${data.aws_iam_policy_document.ec2_assume_role_instance_profile.json}"
}

data "aws_iam_policy_document" "ec2_assume_role_instance_profile" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "Service"

      identifiers = [
        "ec2.amazonaws.com",
      ]
    }
  }
}

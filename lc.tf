resource "aws_launch_configuration" "main" {
  name_prefix = "${format(
    "%s-%s-%s-%s-",
    var.project,
    var.environment,
    var.component,
    var.name
  )}"

  image_id             = "${var.lc_ami_id}"
  instance_type        = "${var.lc_instance_type}"
  spot_price           = "${var.lc_spot_price}"
  key_name             = "${var.lc_key_name}"
  user_data            = "${var.lc_user_data}"
  iam_instance_profile = "${aws_iam_instance_profile.main.id}"

  security_groups = [
    "${aws_security_group.main.id}",
    "${var.lc_additional_sg_ids}",
  ]

  lifecycle {
    create_before_destroy = true
  }
}

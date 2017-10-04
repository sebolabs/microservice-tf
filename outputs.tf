output "security_group_id" {
  value = "${aws_security_group.main.id}"
}

output "security_group_name" {
  value = "${aws_security_group.main.name}"
}

output "launch_configuration_id" {
  value = "${aws_launch_configuration.main.id}"
}

output "autoscaling_group_id" {
  value = "${aws_autoscaling_group.main.id}"
}

output "autoscaling_group_name" {
  value = "${aws_autoscaling_group.main.name}"
}

output "iam_instance_profile_id" {
  value = "${aws_iam_instance_profile.main.id}"
}

output "iam_instance_profile_arn" {
  value = "${aws_iam_instance_profile.main.arn}"
}

output "iam_instance_profile_name" {
  value = "${aws_iam_instance_profile.main.name}"
}

output "iam_instance_profile_unique_id" {
  value = "${aws_iam_instance_profile.main.unique_id}"
}

output "iam_role_arn" {
  value = "${aws_iam_role.main.arn}"
}

output "iam_role_unique_id" {
  value = "${aws_iam_role.main.unique_id}"
}

output "iam_role_name" {
  value = "${aws_iam_role.main.name}"
}

output "subnet_ids" {
  value = "${module.subnets.subnet_ids}"
}

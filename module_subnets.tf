module "subnets" {
  source = "github.com/sebolabs/subnets-tf"

  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"
  name        = "${var.name}"

  vpc_id                  = "${var.vpc_id}"
  availability_zones      = ["${var.availability_zones}"]
  cidrs                   = ["${var.subnets_cidrs}"]
  map_public_ip_on_launch = "${var.subnets_map_public_ip_on_launch}"
  route_tables            = ["${var.subnets_route_tables}"]

  default_tags = "${var.default_tags}"
}

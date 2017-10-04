# microservice-tf

**Info**
------
This Terraform module creates a minumum set of AWS resources (LC, ASG, IAM, SG) to deliver a highly available microservice.

**_Note:_** This module was originally created as my project team effort and was extended by me to meet additional requirements.

**Usage**
------
```python
module "a-service" {
  source = "github.com/sebolabs/microservice-tf.git"

  project     = "lab"
  environment = "test"
  component   = "my-app"
  name        = "a-service"

  vpc_id             = "vpc-XXXXXXX"
  availability_zones = "${data.aws_availability_zones.available.names}"
  subnets_cidrs      = [
    "10.1.0.16/28",
    "10.1.0.32/28",
  ]
  subnets_route_tables = ["rtb-XXXXXXX"]

  lc_ami_id        = "ami-ebd02392"
  lc_instance_type = "m3.medium"
  lc_spot_price    = "0.730"
  lc_user_data     = "${data.template_cloudinit_config.userdata.rendered}"

  asg_size_min               = 1
  asg_size_desired_on_create = 5
  asg_size_max               = 10
  asg_load_balancers         = ["${aws_elb.service.name}"]
}
```

**Terraform compatibility**
------
TF versions tested: 0.9.11

**Dependencies**
------
1. subnets-tf

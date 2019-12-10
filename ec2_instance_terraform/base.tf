provider "aws" {}

resource "aws_iam_role" "ec2_role_test" {
  name = "ec2_role_test"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
      tag-key = "ec2_role_test"
  }
}

resource "aws_iam_instance_profile" "ec2_profile_test" {
  name = "ec2_profile_test"
  role = aws_iam_role.ec2_role_test.name
}

resource "aws_iam_role_policy" "ec2_policy_test" {
  name = "ec2_policy_test"
  role = aws_iam_role.ec2_role_test.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

data "aws_ami" "packer_generated_ami" {
  most_recent = true
  owners = ["self"]

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "name"
    values = ["packer-example-*"]
  }

}

resource "aws_instance" "dannyinstance_1" {
  ami           = data.aws_ami.packer_generated_ami.id
  instance_type = var.aws_instance_type
  key_name      = var.aws_key_name
  iam_instance_profile = aws_iam_instance_profile.ec2_profile_test.name
}

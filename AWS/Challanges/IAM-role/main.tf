data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
      name = "name"
      values = [ "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*" ]
    }
  
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }

  owners = [ "099720109477" ]

}

data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}


data aws_iam_policy_document "s3_read_access" {
  statement {
    actions = ["s3:Get*", "s3:List*"]

    resources = ["arn:aws:s3:::*"]
  }
}

resource "aws_iam_role" "ec2_iam_role" {
  name = "ec2_iam_role"

  assume_role_policy = "${data.aws_iam_policy_document.ec2_assume_role.json}"
}


resource "aws_iam_role_policy" "join_policy" {
  depends_on = [aws_iam_role.ec2_iam_role]
  name       = "join_policy"
  role       = "${aws_iam_role.ec2_iam_role.name}"

  policy = "${data.aws_iam_policy_document.s3_read_access.json}"
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "instance_profile"
  role = "${aws_iam_role.ec2_iam_role.name}"
}

resource "aws_s3_bucket" "openbucket" {
    bucket = "250224-${aws_key_pair.mykey.key_name}"
  }

resource "aws_key_pair" "mykey" {
    key_name = "task-key"
    public_key = file("~/.ssh/id_rsa.pub")
  
}

resource "aws_s3_bucket_public_access_block" "access" {
  bucket = aws_s3_bucket.openbucket.id
  
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_instance" "name" {

    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    key_name = aws_key_pair.mykey.key_name
    #iam_instance_profile = "${aws_iam_instance_profile.instance_profile}"
    iam_instance_profile = "${aws_iam_instance_profile.instance_profile.name}"
    
    root_block_device {
      volume_size = 8
      volume_type = "gp3"
    }

}
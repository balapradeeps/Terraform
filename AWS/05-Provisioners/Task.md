

 • Create a key pair resource with the given name and public key.

•  Create a VPC resource with the given CIDR block.

•  Create a subnet resource within the VPC, with the given CIDR block, availability zone, and public IP mapping.

•  Create an internet gateway resource attached to the VPC.

•  Create a route table resource for the VPC, with a default route to the internet gateway.

•  Associate the route table with the subnet.

•  Create a security group resource for the VPC, with the given name, description, ingress, and egress rules.

•  Create an EC2 instance resource with the given AMI, instance type, key name, security group, and subnet.

•  Establish an SSH connection to the EC2 instance using the private key and the public IP.

•  Copy the local files app.py and script.sh to the remote locations /home/ubuntu/app.py and /home/ubuntu/script.sh on the EC2 instance.

•  Run a series of commands on the EC2 instance, such as making the script executable and executing it.
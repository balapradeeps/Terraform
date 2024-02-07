# NOTES:
* Instance created 
* VPC Created 
* Security Group Creadted 
* Load balance Target Created 

# Need to trouble shoot
* Subnets have two and one of them not created  
* Tags of servers not loaded 
* CIDR got error and not able to destroy :

## Error:
 targetgroup/myTG/8c2557f2bf76f245-20240207120444669700000002]
╷
│ Error: creating EC2 Subnet: InvalidSubnet.Conflict: The CIDR '10.0.0.0/24' conflicts with another subnet
│       status code: 400, request id: e6dcaa6c-c7fb-4e84-8a20-39db6e106a67
│
│   with aws_subnet.mysubnet-1,
│   on main.tf line 5, in resource "aws_subnet" "mysubnet-1":
│    5: resource "aws_subnet" "mysubnet-1" {
│
╵
╷
│ Error: "igw-06c1b31be94e7ba1a" is not a valid CIDR block: invalid CIDR address: igw-06c1b31be94e7ba1a
│
│   with aws_route_table.RT,
│   on main.tf line 24, in resource "aws_route_table" "RT":
│   24: resource "aws_route_table" "RT" {

    it shoud create but both mysub-1 and mysub-2 have same cidr block now i noticed

* Need to check other services and better use default onr 
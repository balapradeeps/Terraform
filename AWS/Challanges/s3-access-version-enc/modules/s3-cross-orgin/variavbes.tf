variable "bucketname" {
  description = "value of the bucket"
  type = string

}

variable "tags" {
    
  description = "value of tags to map"
  type = map(string)
  default = {}

}
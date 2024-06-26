data "aws_ami" "eazytuto-ami"{
    most_recent = true

    filter {
      name =  "name"
      values = ["eazytuto-*"]
    }
    filter {
      name = "owner-id" 
      values = [925037323203]
    }
    owners = [925037323203]
}
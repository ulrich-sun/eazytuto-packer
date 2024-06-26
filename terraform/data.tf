data "aws_ami" "eazytuto-ami"{
    most_recent = true

    filter {
      name =  "name"
      values = ["eazytuto-*"]
    }
    filter {
      name = "owner-id" 
      values = [339713101899]
    }
    owners = [339713101899]
}
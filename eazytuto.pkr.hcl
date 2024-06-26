packer {
    required_plugins {
        amazon = {
            version = "> 0.0.2"
            source = "github.com/hashicorp/amazon"
        }
    }
}

locals {
    timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "eazytuto" {
  ami_name      = "eazytuto-${local.timestamp}"
  instance_type = "t2.medium"
  region        = "us-east-1"
  source_ami    = "ami-0d71ca6a78e324f68" #"ami-0ea68698d2ac99777"
  ssh_username  = "centos"
  run_tags      = {
    Name        = "eazytuto-ami-builder" 
  }
  launch_block_device_mappings {
    device_name = "/dev/sda1"
    volume_size = 20 
    volume_type = "gp2"
    delete_on_termination = true
  }
}

build {
  name = "eazytuto"
  sources = [
    "source.amazon-ebs.eazytuto"
  ]

  provisioner "shell" {
    execute_command = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
    script          = "docker.sh"
  }
  provisioner "file" {
    source = "./defaults.cfg"
    destination = "/etc/cloud/cloud.cfg.d/defaults.cfg"
  }
  provisioner "file" {
    source = "./motd"
    destination = "/etc/motd"
  }

  post-processor "manifest" {
    output = "manifest.json"
    strip_path = true
  }
}
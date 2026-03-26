#terraform settings
terraform{
    required_providers{
        aws={
            source = "hashicorp/aws"
            version= ">= 4.16"
        }
    }
    required_version=">= 1.2.0"
}
#providers
provider "aws"{
    region= var.region
}

#data_source
data "aws_subnet" "selected_subnet" {
    id = "subnet-0a4518da5927f157e"
}
#resources
resource "aws_instance" "webserver"{
    ami = "ami-0453ec754f44f9a4a"
    instance_type="t2.micro"
    subnet_id = data.aws_subnet.selected_subnet.id
    tags={
        name = var.server_name
    }
}
#input
variable "region"{
    description="region for aws resources"
    type= string
    default="us-east-1"
}

variable "server_name"{
    description = "name of the server running the website"
    type = string
}
#output
output "server_id"{
    value = aws_instance.webserver.id
}

output "server_arn"{
    value = aws_instance.webserver.arn 
}
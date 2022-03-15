#Vai olhar pro provider que setamos, olhar pro tipo que damos "aws_ami"
data "aws_ami" "ubuntu" {
    most_recent = true

    #Pasasndo um filtro por nome, values é o nome que eu quero filtrar
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    #O filtro será feito apenas pelas imagens por esse usuario abaixo
    owners = ["099720109477"] #Ubuntu
}

resource "aws_instance" "web" {
  ami = data.aws_ami.ubuntu.id #ami especifica do ubuntu us-east-1
  instance_type = "t2.micro"

  tags = {
      Name = "Hello World"
  }
}

#Terraform init -upgrade -> funciona igual o git init ele cria uma pasta .terraform com os plugins
#Terraform plan -out=path -> -out pega o plano que é escrito no terminal e colocar no arquivo, plan mostra oque será feito, como um sumário contendo as difernças das novas implementações para a atual
#Terraform apply "path" para executar na aws
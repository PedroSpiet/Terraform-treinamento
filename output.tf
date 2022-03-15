output "ip_address" {
  value = aws_instance.web.public_ip
         #Tipo Recurso - #Nome do Recurso(Web nesse caso) # ip
}

# Ao ser executado o terraform apply, será imprimido na tela esse valor
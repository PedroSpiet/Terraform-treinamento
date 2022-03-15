provider "aws" {
    region: "us-east-1"
    version = "~>2.0"
}


terraform {

    #Grava os estados do terraform no S3, sem isso ele gravará localmente
  backend "s3" {
      #Lembre de trocar o bucket para o seu, não pode ser o msmo nome
      bucket = "descomplicando-terraform-pedrospiet-states"
      key = "terraform-test.tfstate"
      region = "us-east-1"
  }
}
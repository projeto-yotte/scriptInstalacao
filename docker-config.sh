#!/bin/bash

# Configurações do Docker
    
echo -e "\033[${RED}m[yotte.u]:${NC} Bem vindo!! Iremos iniciar a instalação"

sleep 3

echo -e "\033[${RED}m[yotte.u]:${NC} Atualizando e baixando pacotes do programa!" 
echo -e "\033[${RED}m[yotte.u]:${NC} Aguarde um momento"

# Atualiza a lista de pacotes
sudo apt update -y && sudo apt upgrade -y

echo -e "\033[${RED}m[yotte.u]:${NC} Pacotes atualizados!"

sleep 2

echo -e "\033[${RED}m[yotte.u]:${NC}Iniciando instalação e configuração do Docker..."
# Instalação do Docker
sudo apt install  docker.io -y

sleep 2

echo -e "\033[${RED}m[yotte.u]:${NC} Docker instalado com sucesso!"

# Adiciona o usuário atual ao grupo docker para executar comandos docker sem sudo

# Reinicia o serviço do Docker para aplicar as alterações
sudo systemctl start docker

echo "Docker foi instalado e configurado com sucesso. Por favor, faça logout e login novamente para aplicar as alterações do grupo Docker."

#!/bin/bash


# Iniciando o script de instalação e configuração do Docker

# Instalação do Docker
sudo apt update -y && sudo apt upgrade -y

sleep 5

# Verificar se o Docker foi instalado corretamente
sudo docker --version

sleep 5

# Inicia o serviço do Docker
sudo systemctl start docker
sleep 5
# Habilitar o serviço do Docker
sudo systemctl enable docker

sleep 5
echo -e "\033[${RED}m[yotte.u]:${NC} Instalando Mysql"
# Fazer pull da imagem do MySQL 5.7
sudo docker pull mysql:latest
sleep 2
echo -e "\033[${RED}m[yotte.u]:${NC} Imagem carregada com sucesso!"

sudo docker build -t yotte-bd .
sleep 15
# Criando container e configurando o MySQL
sudo docker run -d -p 3306:3306 --name yotte-container -e "MYSQL_DATABASE=yotte" -e "MYSQL_ROOT_PASSWORD=yotte2023" mysql:latest

docker run -d --name meu-container -p 3306:3306 yotte-bd

sleep 15

echo -e "\033[${RED}m[yotte.u]:${NC} Container do Banco de Dados criado com sucesso!"

sudo apt update -y
# Mensagem de confirmação da instalação e configuração do Docker
echo "Docker foi instalado e configurado com sucesso. O Docker está pronto para uso!"

sleep 15


sleep 15
sudo docker exec -i yotte-container mysql -u root -pyotte2023 < /home/ubuntu/scriptInstalacao/yotte-bd.sql

 echo -e "\033[${RED}m[yotte.u]:${NC} Docker Noct.u executado com sucesso!"

sudo chmod +x java-install.sh

./java-install.sh

sleep 15


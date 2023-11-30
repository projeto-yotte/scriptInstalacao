#!/bin/bash

# Configurações de cores
RED='\033[0;31m'
NC='\033[0m' # No Color

# Início do script de instalação e configuração do Docker
echo -e "\033[${RED}m[yotte.u]:${NC} Bem-vindo!! Iniciando a instalação e configuração do Docker."

# Atualiza a lista de pacotes
sudo apt update -y && sudo apt upgrade -y
sudo apt-get install wmctrl
echo -e "\033[${RED}m[yotte.u]:${NC} Pacotes atualizados!"

# Instalação do Docker
sudo apt install docker.io -y
echo -e "\033[${RED}m[yotte.u]:${NC} Docker instalado com sucesso!"

# Adiciona o usuário atual ao grupo docker para executar comandos docker sem sudo
sudo usermod -aG docker $USER

# Reinicia o serviço do Docker para aplicar as alterações
sudo systemctl start docker
echo -e "Docker foi instalado e configurado com sucesso. Por favor, faça logout e login novamente para aplicar as alterações do grupo Docker."

# Construção da imagem Docker usando o Dockerfile separado
echo -e "\033[${RED}m[yotte.u]:${NC} Construindo a imagem Docker"
sudo docker build -t yotte -f Dockerfile .
echo -e "\033[${RED}m[yotte.u]:${NC} Imagem Docker construída com sucesso!"

# Criação do contêiner

#sudo docker run -d -name yotte -e "MYSQL_ROOT_PASSWORD=yotte2023" -e "MYSQL_DATABASE=yotte "-e "MYSQL_USER=yotte" -e "MYSQL_PASSWORD=yotte2023" -p 3306:3306 mysql:latest
sleep 10
#sudo docker run -d -p 3306:3306 --name yotte -e "MYSQL_DATABASE=yotte" -e "MYSQL_ROOT_PASSWORD=yotte2023" mysql:latest;
sudo docker run -d --name yotte-container -p 3306:3306 yotte
sleep 13
echo -e "\033[${RED}m[yotte.u]:${NC} Contêiner do Banco de Dados criado com sucesso!"

# Atualização dos pacotes
sudo apt update -y
echo "Docker foi instalado e configurado com sucesso. O Docker está pronto para uso!"

# Execução de comandos no contêiner MySQL
sudo docker exec -i yotte-container yotte -u yotte -pyotte2023 < /home/ubuntu/scriptInstalacao/yotte-bd.sql
echo -e "\033[${RED}m[yotte.u]:${NC} Docker Noct.u executado com sucesso!"

# Permissões de execução para o script Java
sudo chmod +x java-install.sh

# Execução do script Java
./java-install.sh

sleep 15
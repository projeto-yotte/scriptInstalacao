#!/bin/bash

# Função para exibir a arte ASCII
show_ascii_art() {
  cat << "EOF"
      ▄█     █▄  ▄██   ▄    ▄██████▄   ▄██████▄      ███        ▄████████ 
     ███     ███ ███   ██▄ ███    ███ ███    ███ ▀█████████▄   ███    ███ 
     ███     ███ ███▄▄▄███ ███    ███ ███    ███    ▀███▀▀██   ███    █▀  
     ███     ███ ▀▀▀▀▀▀███ ███    ███ ███    ███     ███   ▀  ▄███▄▄▄     
     ███     ███ ▄██   ███ ███    ███ ███    ███     ███     ▀▀███▀▀▀     
     ███     ███ ███   ███ ███    ███ ███    ███     ███       ███    █▄  
     ███ ▄█▄ ███ ███   ███ ███    ███ ███    ███     ███       ███    ███ 
      ▀███▀███▀   ▀█████▀   ▀██████▀   ▀██████▀     ▄████▀     ██████████ 
                                                                          
    =====================================================================                                                             
                BEM VINDO AO WIZZARD DE INSTALAÇÃO YOTTE     
    =====================================================================                                              
EOF
}

# Cores para melhorar a aparência
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # Sem Cor

echo -e "${RED}[yotte.u]:${NC} Bem-vindo ao Wizard YOTTE! Iniciando a instalação e configuração do Docker."

# Exibir a arte ASCII
show_ascii_art

# Atualizar a lista de pacotes sem mensagens
sudo apt-get update -y > /dev/null

# Atualizar pacotes sem mensagens
sudo apt-get upgrade -y > /dev/null

echo -e "${RED}[yotte.u]:${NC} Pacotes atualizados!"

# Instalar wmctrl sem mensagens
sudo apt-get install wmctrl -y > /dev/null

echo -e "${RED}[yotte.u]:${NC} wmctrl instalado com sucesso!"

# Instalar Docker sem mensagens
sudo apt-get install docker.io -y > /dev/null

echo -e "${RED}[yotte.u]:${NC} Docker instalado com sucesso!"

# Adicionar o usuário atual ao grupo docker
sudo usermod -aG docker $USER

# Reiniciar o serviço Docker para aplicar alterações
sudo systemctl start docker

echo -e "${RED}[yotte.u]:${NC} Docker foi instalado e configurado com sucesso. Por favor, faça logout e login novamente para aplicar as alterações do grupo Docker."

# Construir a imagem Docker usando o Dockerfile separado
echo -e "${RED}[yotte.u]:${NC} Construindo a imagem Docker"
sudo docker build -t yotte -f Dockerfile .

echo -e "${RED}[yotte.u]:${NC} Imagem Docker construída com sucesso!"

# Criar o contêiner do Banco de Dados
sudo docker run -d --name yotte-container -p 3306:3306 yotte

# Esperar um pouco para garantir que o contêiner do banco de dados está pronto
sleep 10

echo -e "${RED}[yotte.u]:${NC} Contêiner do Banco de Dados criado com sucesso!"

# Atualizar pacotes novamente
sudo apt-get update -y > /dev/null

echo -e "Docker foi instalado e configurado com sucesso. O Docker está pronto para uso!"

# Executar comandos no contêiner MySQL
sudo docker exec -i yotte-container yotte -u yotte -pyotte2023 < /home/ubuntu/scriptInstalacao/yotte-bd.sql

echo -e "${RED}[yotte.u]:${NC} Docker Noct.u executado com sucesso!"

# Adicionar permissões de execução ao script Java
sudo chmod +x java-install.sh

# Executar o script Java
./java-install.sh

# Esperar mais um pouco antes de encerrar
sleep 15

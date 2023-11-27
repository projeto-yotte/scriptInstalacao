#!/bin/bash

# Verificar se o usuário já existe

# URL do arquivo JAR no GitHub
jar_url="https://github.com/projeto-yotte/yotte-monitoramento-grupo/raw/main/target/yotte-monitoramento-jar-with-dependencies.jar"

# Nome do arquivo JAR após o download
jar_nome="yotte-monitoramento-jar-with-dependencies.jar"


# Atualização e Upgrade


sleep 5
# Versão do Java a ser instalada
JAVA_VERSION=17

if java -version 2>&1 | grep -q "openjdk version \"$JAVA_VERSION"; then
        echo "Seu Java já está instalado"
    else
        echo "A versão do Java é inferior"
        echo "Deseja atualizar? [s/n]"
        read get

        if [ "$get" == "s" ]; then
            sudo apt install openjdk-${JAVA_VERSION}-jre-headless -y
        else
            echo "Finalizando script..."
        fi
    fi



sleep 5
echo -e "\033[${RED}m[yotte.u]:${NC} Baixando o wget!"

sudo apt install wget -y

echo -e "\033[${RED}m[yotte.u]:${NC} Instalado com sucesso!!"

  sleep 5

  sudo wget "$jar_url" -O "$jar_nome"


 sudo java -jar "$jar_nome"

 echo -e "\033[${RED}m[yotte.u]:${NC} Java executado!!"

 sleep 2


# Clonar o repositórios do projeto



# Navegue até o diretório do repositório clonado

# Execute o comando Maven para criar o JAR

sleep 5

#Configurando permissões




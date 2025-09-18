#!/bin/bash

# Diretório temporário para download
TEMP_DIR="/tmp/discord_update"
DISCORD_URL="https://discord.com/api/download?platform=linux&format=deb"

# Cria o diretório temporário
mkdir -p "$TEMP_DIR"
cd "$TEMP_DIR" || exit 1

# Faz o download da última versão do Discord
echo "A fazer o download da última versão do Discord..."
wget -O discord.deb "$DISCORD_URL"

# Instala o pacote baixado
echo "A instalar a nova versão..."
sudo dpkg -i discord.deb

# Resolve dependências, se necessário
sudo apt-get -f install -y

# Remove ficheiros temporários
echo "A limpar ficheiros temporários..."
rm -rf "$TEMP_DIR"

echo "Discord atualizado com sucesso!"


#!/usr/bin/env bash

# Install Structurizr UI
set -e

NAME=structurizr
STRUCTURIZR_INSTALL_DIR=${1:-"/home/vscode/.local/bin/${NAME}/"}
APP_NAME=${NAME}-lite
WAR_NAME=${APP_NAME}.war


echo "[[${NAME}] Creating /home/vscode/.local/bin/${NAME} directory..."
mkdir -p /home/vscode/.local/bin/${NAME}

echo "[${NAME}] Downloading ${NAME}..."
curl -s "https://github.com/${NAME}/${NAME}/releases/latest" \
| grep "browser_download_url" \
| cut -d : -f 2,3 \
| tr -d \" \
| xargs wget -P "/home/vscode/.local/bin/${NAME}"

echo "[${NAME}] Creating script file /usr/bin/${NAME}"

printf "#!/bin/sh\n\nDATA_DIR=\$1\n\nexec java -Djdk.util.jar.enableMultiRelease=false -jar ${STRUCTURIZR_INSTALL_DIR}${WAR_NAME} local \"\${DATA_DIR}\"" > "/usr/bin/${APP_NAME}"
echo "[${NAME}] Setting execute permissions on script file /usr/bin/${APP_NAME}"
chmod +x "/usr/bin/${APP_NAME}"

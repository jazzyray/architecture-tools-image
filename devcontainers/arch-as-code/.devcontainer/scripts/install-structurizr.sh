#!/usr/bin/env bash

# Install Structurizr UI
set -e

NAME=structurizr
STRUCTURIZR_INSTALL_DIR=${1:-"/home/vscode/.local/bin/${NAME}/"}
APP_NAME=${NAME}
WAR_NAME=${APP_NAME}.war

echo "[[${NAME}] Creating /home/vscode/.local/bin/${NAME} directory..."
echo "[${NAME}] Downloading ${NAME}..."
curl -O https://download.structurizr.com/structurizr.war
mkdir -p /home/vscode/.local/bin/${NAME}
mv ${WAR_NAME} /home/vscode/.local/bin/${NAME}/${WAR_NAME}

echo "[${NAME}] Creating script file /usr/bin/${NAME}"
printf "#!/bin/sh\n\n\nexec java -Djdk.util.jar.enableMultiRelease=false -jar ${STRUCTURIZR_INSTALL_DIR}${WAR_NAME} \$@" > "/usr/bin/${APP_NAME}"
echo "[${NAME}] Setting execute permissions on script file /usr/bin/${APP_NAME}"
chmod +x "/usr/bin/${APP_NAME}"

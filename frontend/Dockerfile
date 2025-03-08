FROM node:23.9.0-slim

RUN apt update && apt install -y \
    git \
    && rm -rf /var/lib/apt/lists/* 

#Define o usuário que será utilizado dentro do container
USER node

#Local de trabalho dentro do container
WORKDIR /app

#Copia todos os arquivos "packege" para dentro do container
COPY --chown=node:node ./frontend/package*.json ./

COPY --chown=node:node ./frontend/start.sh ./

#Baixa as dependências - Habilidado em Produção
#RUN npm install

##Comando que será executado dentro do container, o caminho é relativo ao container
CMD [ "/app/start.sh" ]
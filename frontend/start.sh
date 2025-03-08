#!/bin/bash

npm install

#Lê um arquivo nullo no container para que não seja interrompido
tail -f /dev/null

#Para produção
#npm run start:prod
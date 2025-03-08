FROM python:3.11-slim

# Evitar prompts durante a instalação de pacotes
ENV DEBIAN_FRONTEND=noninteractive
ENV PIPENV_VENV_IN_PROJECT=True

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y \
    curl \
    pipenv \
    postgresql-client \
    git \
    && rm -rf /var/lib/apt/lists/*

# Criar diretório /app
RUN mkdir /app

# Criar um usuário não privilegiado com o UID 1000 (equivalente ao usuário do host)
ARG USER_UID=1000
ARG USER_GID=1000
RUN groupadd -g $USER_GID python && \
    useradd -m -u $USER_UID -g $USER_GID python && \
    chown -R python:python /app

# Definir diretório de trabalho
WORKDIR /app

# Copiar arquivos de dependências e ajustar permissões
COPY --chown=python:python ./backend/requirements.txt .

# Instalar dependências do Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o restante do código do backend e ajustar permissões
COPY --chown=python:python ./backend .

# Alternar para o usuário não privilegiado
USER python

# Expor a porta 8000 para o Django
EXPOSE 8000

# Comando para rodar o servidor Django
#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

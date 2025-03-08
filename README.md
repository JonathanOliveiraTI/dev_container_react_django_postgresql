# 🚀 Ambiente de Desenvolvimento em Container

🔹 **Stack:** Python (Django) | Node.js (React) | PostgreSQL
🔹 **DevContainer:** Ambiente pronto para uso no VS Code

## 🔧 Como Utilizar o Ambiente

Para instruções detalhadas sobre como configurar e rodar o ambiente, consulte a seção [Como Utilizar o Ambiente](#como-utilizar-o-ambiente-detalhado) no final deste documento.

## 📌 Pré-requisitos  
Para rodar este ambiente em um **DevContainer** no Windows, é necessário ter instalado:  

- **Windows Subsystem for Linux (WSL 2)** – Para executar um ambiente Linux no Windows.  
- **Docker e Docker Compose** – Para gerenciar e rodar os containers.  
- **Visual Studio Code (VS Code)** – Editor de código recomendado.  
- **Extensão Remote - Containers do VS Code** – Para suporte ao DevContainer.  

Caso esteja usando **Linux ou macOS**, basta ter o Docker, Docker Compose e o VS Code com a extensão **Remote - Containers** instalados.  

---

## 🏗️ Tecnologias Utilizadas

### 🌐 Frontend

- ⚛️ React
- 🔗 Axios
- 🎨 Bootstrap

### 🖥️ Backend

- 🐍 Django
- 🔥 Django REST Framework

### 🗄️ Banco de Dados

- 🐘 PostgreSQL

## 🎯 Benefícios deste Ambiente

✅ **Facilidade de Configuração**

> Basta abrir o repositório no VS Code e rodar `devcontainer open`.

🐳 **Isolamento Completo**

> Todo o ambiente roda em containers, sem impactar seu sistema operacional.

🔁 **Reprodutibilidade Garantida**

> Todos os desenvolvedores terão o mesmo ambiente, evitando o clássico "funciona na minha máquina".

🔥 **Stack Integrada**

> Backend e frontend já configurados para rodar juntos com Django, React e PostgreSQL.

⚡ **Hot Reload**

> Atualizações automáticas para Django e React, agilizando o desenvolvimento.

📦 **Gerenciamento Simplificado de Dependências**

> Cada serviço roda em seu próprio container, evitando conflitos.

🔧 **Ambiente Personalizável**

> Modifique o `devcontainer.json` conforme suas necessidades.

🔐 **Segurança Aprimorada**

> Seu ambiente de desenvolvimento fica isolado do sistema, minimizando riscos.

🚀 **Pronto para começar?** Clone o repositório e aproveite um setup rápido e eficiente!

---

## Como Utilizar o Ambiente (Detalhado)

### Comandos Backend - VS Code

#### 1️⃣ Ativando o ambiente virtual (VENV) para Python

```sh
cd backend/
pipenv install  # Instala dependências
pipenv shell  # Ativa o ambiente virtual
```

#### 2️⃣ Instalando dependências

```sh
ipenv install -r requirements.txt
```

#### 3️⃣ Restaurando o dump e realizando o migrate

```sh
pg_restore --clean -U postgres -h db -p 5432 -d postgres -v dump_bd.dump
python manage.py migrate
```

4️⃣ Rodando o servidor

```sh
python manage.py runserver 0.0.0.0:8000
```

**Acesso:** [localhost:8000](http://localhost:8000) e [localhost:8000/admin](http://localhost:8000/admin/)

### 🔄 Gerando Dump do Banco de Dados

```sh
pg_dump -U postgres -h db -p 5432 -F c -b -v -f dump_bd.dump postgres
```

> **Explicação dos parâmetros:**
>
> - `pg_dump` → Comando para fazer backup do banco.
> - `-U postgres` → Usuário do PostgreSQL.
> - `-h db` → Nome do host onde o PostgreSQL está rodando.
> - `-p 5432` → Porta do PostgreSQL (padrão: 5432).
> - `-F c` → Define o formato customizado de backup.
> - `-b` → Inclui objetos grandes (BLOBs).
> - `-v` → Modo verbose.
> - `-f dump_bd.dump` → Nome do arquivo de backup.
> - `postgres` → Nome do banco de dados a ser copiado.

**Obs.:** O usuário e senha usados para criação e recuperação do dump são os mesmos das variáveis de ambiente `POSTGRES_USER` e `POSTGRES_PASSWORD`.

### 🔄 Recuperando Dump do Banco de Dados

```sh
pg_restore --clean -U postgres -h db -p 5432 -d postgres -v dump_bd.dump
```

> **Explicação dos parâmetros:**
>
> - `pg_restore` → Comando para restaurar um backup feito com `pg_dump`.
> - `--clean` → Apaga os objetos do banco antes de restaurar.
> - `-U postgres` → Usuário do PostgreSQL.
> - `-h db` → Nome do servidor onde o PostgreSQL está rodando.
> - `-p 5432` → Porta do PostgreSQL.
> - `-d postgres` → Nome do banco de dados de destino.
> - `-v` → Modo verbose.
> - `dump_bd.dump` → Arquivo de backup gerado.

### 🔄 Sincronização entre o Banco de Dados e Django

```sh
python manage.py migrate
```

---

## 🎨 Comandos Frontend

### 1️⃣ Acessando o Container do Frontend

```sh
docker compose exec frontend bash
```

### 2️⃣ Instalando Dependências

```sh
npm install
```

### 3️⃣ Build da Aplicação

```sh
npm run build
```

### 4️⃣ Iniciando o Servidor

```sh
npm start
```

**Acesso:** [localhost:3000](http://localhost:3000)


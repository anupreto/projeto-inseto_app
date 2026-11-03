# 🪲 Wiki Invertebrados

> **Uma enciclopédia digital e colaborativa desenvolvida para catalogar, consultar e organizar espécies de invertebrados de forma rápida e intuitiva.**

---

## 🛠️ Tecnologias & Arquitetura

O projeto foi estruturado com uma arquitetura moderna, dividida entre um backend altamente performático containerizado e um frontend mobile leve:

* **Backend & API:** PHP 8.x + Apache
* **Banco de Dados:** MySQL 8.0
* **Containerização:** Docker & Docker Compose
* **Frontend Mobile:** React Native + Expo Framework
* **Controle de Versão:** Git & GitHub

---

## 🚀 Como Executar o Projeto

Siga os passos abaixo para levantar todo o ecossistema (backend + banco de dados + aplicação mobile) na sua máquina local.

### 📋 Pré-requisitos
Antes de começar, certifique-se de ter instalado no seu sistema:
* [Docker Engine](https://www.docker.com/) & **Docker Compose**
* [Node.js](https://nodejs.org/) (versão LTS) & **npm**

---

### 1️⃣ Clonar o Repositório
```bash
git clone https://github.com/anupreto/projeto-inseto_app.git
cd projeto-inseto_app
```

### 2️⃣ Subir o Backend & Banco de Dados (Docker)
```bash
docker compose up -d --build
```

### 3️⃣ Instalar as Dependências do App (Expo)
```bash
npm install
```
### 4️⃣ Iniciar a Aplicação Mobile
```bash
npx expo start
```

# 🪲 Wiki Invertebrados

> **Uma enciclopédia digital e colaborativa para catalogar e explorar a fauna de invertebrados.**
> *Desenvolvido com backend containerizado em PHP/MySQL e interface mobile em React Native com Expo.*

---

## 🚀 Setup Rápido do Ambiente

Se acabaste de clonar o repositório, segue a receita abaixo para colocar a infraestrutura inteira a rodar em segundos!

### 🛠️ Pré-requisitos
Certifica-te de que tens instalado no teu sistema:
- **Docker Engine** + **Docker Compose**
- **Node.js** (LTS) & **npm**

---

## ⚡ Passo a Passo: Pôr a Máquina a Rugir

### 1️⃣ Subir o Backend & Banco de Dados (Docker)
Constrói e levanta os contentores PHP (Apache) e MySQL em segundo plano com um único comando:

```bash
docker compose up -d --build

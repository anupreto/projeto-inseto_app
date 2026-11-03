# Guia de Instalação e Execução - Wiki Invertebrados

## 1. Pré-requisitos
- Node.js e npm instalados
- Docker e Docker Compose instalados na máquina

---

## 2. Subir o Backend (Docker)
Na pasta raiz do projeto, roda o comando para construir e iniciar os contentores em segundo plano:
\`\`\`bash
docker compose up -d --build
\`\`\`

## 3. Instalar Dependências do Frontend (Expo)
Ainda na pasta raiz (ou na pasta respetiva do mobile), instala as dependências do projeto:
\`\`\`bash
npm install
\`\`\`

## 4. Iniciar a Aplicação Mobile
Para correr a aplicação com o Expo:
\`\`\`bash
npx expo start
\`\`\`

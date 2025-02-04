# Usa a versão LTS do Node.js
FROM node:18

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos essenciais primeiro para cache eficiente
COPY package.json package-lock.json ./

# Instala as dependências
RUN npm install

# Copia o restante do código, incluindo o diretório prisma/
COPY . .

# Garante que o Prisma gera os arquivos corretamente
RUN npx prisma generate

# Define o comando para iniciar a aplicação
CMD ["npm", "start"]

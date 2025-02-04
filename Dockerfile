# Usa a versão LTS do Node.js
FROM node:18

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos essenciais para instalar as dependências
COPY package.json package-lock.json ./

# Instala as dependências
RUN npm install

RUN npx prisma generate


# Copia o restante do código para o contêiner
COPY . .

# Define o comando para iniciar a aplicação
CMD ["npm", "start"]

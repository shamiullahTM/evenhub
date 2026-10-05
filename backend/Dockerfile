FROM node:20-bookworm-slim

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends openssl \
    && rm -rf /var/lib/apt/lists/*

COPY package.json ./
RUN npm install --no-package-lock

COPY prisma/ ./prisma/
COPY app.js server.js ./
COPY src/ ./src/
RUN npx prisma generate

EXPOSE 3001

CMD ["npm", "start"]
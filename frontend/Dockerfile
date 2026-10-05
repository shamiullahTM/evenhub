FROM node:20-bookworm-slim

WORKDIR /app

COPY package.json ./
RUN npm install --no-package-lock

COPY . .
ARG NEXT_PUBLIC_API_URL=http://backend:3001/api
ENV NEXT_PUBLIC_API_URL=$NEXT_PUBLIC_API_URL
RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "start"]
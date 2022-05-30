FROM node:16-alpine 

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm i

COPY . .

RUN npm run build

FROM node:16-alpine

WORKDIR /app
COPY --from=0 /app ./
COPY . .

EXPOSE 8080
CMD ["node", "./build"]

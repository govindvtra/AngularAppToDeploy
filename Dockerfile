FROM node:alpine AS builder
WORKDIR /home/app
COPY . /home/app
RUN npm install
RUN npm run build-prod
FROM nginx:alpine

COPY --from=builder /home/app/dist/todo  /usr/share/nginx/html

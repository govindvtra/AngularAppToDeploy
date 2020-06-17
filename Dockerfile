FROM node:alpine AS builder
WORKDIR /app
RUN npm install
COPY . .
FROM nginx:alpine

COPY --from=builder /app/dist/todo  /usr/share/nginx/html

FROM node:12.2.0 AS builder
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
RUN npm install
COPY . .
FROM nginx:alpine

COPY --from=builder /app/dist/todo  /usr/share/nginx/html

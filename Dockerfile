FROM node:16-alpine as builder
WORKDIR /home/app
COPY ./frontend/package.json .
RUN npm config set strict-ssl false
RUN npm install
COPY ./frontend .
RUN npm run build

FROM nginx
COPY --from=builder /home/app/build /usr/share/nginx/html
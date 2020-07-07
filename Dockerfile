FROM node:alpine as builder
WORKDIR '/srv'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=builder /srv/build /usr/share/nginx/html

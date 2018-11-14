FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# /usr/share/nginx/html from the nginx docker HUB doc
COPY --from=builder /app/build /usr/share/nginx/html
 

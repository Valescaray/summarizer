FROM node:20-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
# Copy a JS template file \
COPY ./config.template.js /usr/share/nginx/html/config.template.js

# Copy entrypoint script
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
FROM node:20-alpine AS builder
WORKDIR /app
COPY app/threat-composer/package.json app/threat-composer/yarn.lock ./
RUN yarn install --frozen-lockfile
COPY app/threat-composer/. ./
RUN yarn build


FROM nginxinc/nginx-unprivileged

# Copy build output
COPY --from=builder /app/build /usr/share/nginx/html

# Copy Nginx config (make sure it doesn’t require root-only paths)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]



FROM ghcr.io/cirruslabs/flutter:3.24.3 AS build

WORKDIR /app

# dd:
COPY . .

RUN flutter pub get

RUN flutter build web

FROM nginx:alpine

COPY --from=build /app/build/web /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]


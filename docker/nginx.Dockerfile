# Current version of 'latest' as of writing this Dockerfile: 1.25.3
FROM nginx:latest

COPY ./nginx/html:/usr/share/nginx/html
COPY ./nginx/default.conf:/etc/nginx/conf.d/default.conf
FROM python:latest as builder
COPY ./src/ /src/
WORKDIR /src/
RUN pip install mkdocs mkdocs-material
RUN mkdocs build

FROM nginx:stable-alpine
COPY --from=builder /src/site/ /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

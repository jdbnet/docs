FROM python:latest as builder
COPY ./src/ /src/
WORKDIR /src/
RUN pip install mkdocs mkdocs-material mkdocs-git-revision-date-localized-plugin
RUN mkdocs build

FROM nginx:stable-alpine
COPY --from=builder /src/site/ /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

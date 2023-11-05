FROM python:latest as builder
COPY ./docs.jdbnet.co.uk/ /docs.jdbnet.co.uk/
WORKDIR /docs.jdbnet.co.uk/
RUN pip install mkdocs mkdocs-material
RUN mkdocs build
FROM nginx:stable-alpine
COPY --from=builder /docs.jdbnet.co.uk/site/ /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
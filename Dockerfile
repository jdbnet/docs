FROM python:alpine as builder
# COPY ./src/ /src/
# WORKDIR /src/
RUN apk update
RUN apk add git
RUN pip install mkdocs mkdocs-material mkdocs-git-revision-date-localized-plugin mkdocs-git-authors-plugin
WORKDIR ./src/
RUN mkdocs build

FROM nginx:stable-alpine
COPY --from=builder ./src/site/ /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

FROM python:alpine as builder
COPY . /docs
WORKDIR /docs

RUN apk update
RUN apk add git
RUN git config --system --add safe.directory /docs
RUN git config --system --add safe.directory /site
RUN pip install mkdocs mkdocs-material mkdocs-git-revision-date-localized-plugin mkdocs-git-authors-plugin
RUN mkdocs build

FROM nginx:stable-alpine
COPY --from=builder /docs/site/ /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
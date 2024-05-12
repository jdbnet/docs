FROM python:bookworm as builder
COPY . /docs
WORKDIR /docs

RUN apt update
RUN apt add git build-base
RUN git config --system --add safe.directory /docs
RUN git config --system --add safe.directory /site
RUN pip install mkdocs mkdocs-material mkdocs-git-revision-date-localized-plugin mkdocs-git-authors-plugin mkdocs-material[imaging]
RUN mkdocs build

FROM nginx:stable-alpine
COPY --from=builder /docs/site/ /usr/share/nginx/html
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD curl --fail http://localhost:80 || exit 1
CMD ["nginx", "-g", "daemon off;"]

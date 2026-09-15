FROM node:22-slim AS builder

# install git to install plugins
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
COPY --from=oven/bun:1 /usr/local/bin/bun /usr/local/bin/bun

WORKDIR /usr/src/app
COPY package.json .
COPY bun.lock* .
COPY quartz/ ./quartz/
COPY quartz.lock.json* .
RUN bun install --frozen-lockfile && bun run quartz plugin install

FROM node:22-slim
COPY --from=oven/bun:1 /usr/local/bin/bun /usr/local/bin/bun
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/ /usr/src/app/
COPY . .
CMD ["bun", "run", "quartz", "build", "--serve"]

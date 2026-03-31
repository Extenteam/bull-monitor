FROM node:24-alpine
ARG BUILD_VERSION=1.0.0
ENV NODE_ENV="production"

USER node
WORKDIR /home/node

COPY package* ./
RUN npm ci
# TIP: build on the machine
COPY dist dist

EXPOSE 3000
CMD ["node", "dist/daemon"]
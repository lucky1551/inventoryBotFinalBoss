FROM node:18-alpine

# Install system dependencies
RUN apk add --no-cache \
    ca-certificates \
    curl \
    git \
    build-base \
    python3

WORKDIR /app

COPY package*.json ./
RUN npm install --production

COPY . .

# Create and set permissions for baileys_auth directory
RUN mkdir -p ./baileys_auth && \
    chown -R node:node ./baileys_auth && \
    chmod -R 770 ./baileys_auth

USER node

CMD ["npm", "start"]
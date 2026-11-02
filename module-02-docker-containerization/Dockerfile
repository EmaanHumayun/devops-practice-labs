# ==============================================================================
# MULTI-STAGE SECURE CONTAINER BUILD
# STAGE 1: Build & Dependency Resolution
# ==============================================================================
FROM node:20-alpine AS builder

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci --only=production

COPY . .

# ==============================================================================
# STAGE 2: Minimal Distroless Production Runtime
# ==============================================================================
FROM gcr.io/distroless/nodejs20-debian12

WORKDIR /app

ENV NODE_ENV=production
ENV PORT=3000

COPY --from=builder /usr/src/app ./

USER nonroot:nonroot

EXPOSE 3000

CMD ["server.js"]


# ---------------------
# 1. Base image
# ---------------------
FROM node:20-alpine AS builder

# Enable pnpm via corepack
RUN corepack enable

WORKDIR /app

# ---------------------
# 2. Install deps
# ---------------------
# Copy only manifest files first (better caching)
COPY package.json pnpm-lock.yaml ./

# Install dependencies (must be in sync with lockfile)
RUN pnpm install --frozen-lockfile

# ---------------------
# 3. Build Next.js app
# ---------------------
COPY . .
RUN pnpm build

# ---------------------
# 4. Production image
# ---------------------
FROM node:20-alpine AS runner
WORKDIR /app

ENV NODE_ENV=production

# Copy only needed files
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/pnpm-lock.yaml ./pnpm-lock.yaml
COPY --from=builder /app/.next ./.next
#COPY --from=builder /app/public ./public
COPY --from=builder /app/node_modules ./node_modules

EXPOSE 3000
CMD ["npm", "start"]

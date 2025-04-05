FROM node:18-alpine AS base
WORKDIR /app
RUN npm i -g pnpm

FROM base AS install
WORKDIR /app
COPY package.json ./
RUN pnpm install 

FROM install AS build
COPY . .
RUN pnpm build

FROM install AS development
WORKDIR /app
COPY . .
CMD ["pnpm","dev"]

FROM base AS production
WORKDIR /app

ENV NODE_ENV production
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

COPY --from=build /app/next.config.mjs ./next.config.mjs
COPY --from=build /app/public ./public
COPY --from=build /app/dist ./dist
COPY --from=install /app/node_modules ./node_modules
COPY --from=install /app/package.json ./package.json

USER nextjs
EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:3000/api/health || exit 1

CMD ["pnpm", "start"]


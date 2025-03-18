FROM node:18-alpine AS base
WORKDIR /app
RUN npm i -g pnpm

FROM base AS install
WORKDIR /app
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

FROM install AS build
COPY . .
RUN pnpm build

FROM install AS development
WORKDIR /app
COPY ./app ./app
COPY ./components ./components
COPY ./hooks ./hooks
COPY ./public ./public
COPY ./styles ./styles
COPY ./types ./types
COPY ./utils ./utils
CMD ["pnpm","dev"]

FROM node:18-alpine AS production
WORKDIR /app

ENV NODE_ENV production
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

COPY --from=build /app/dist/standalone ./
COPY --from=build /app/next.config.mjs ./next.config.mjs
COPY --from=build /app/public ./public
COPY --from=install /app/node_modules ./node_modules

USER nextjs
EXPOSE 3000
CMD ["node", "server.js"]


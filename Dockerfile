FROM node:alpine

RUN apk add redis
RUN redis-server&

EXPOSE 6379
EXPOSE 3000
EXPOSE 8000
EXPOSE 8080

WORKDIR /app

COPY --chown=node:node package.json /app/package.json
COPY --chown=node:node script1.js /app/script1.js
COPY --chown=node:node script2.js /app/script2.js

RUN yarn

USER node

ENTRYPOINT ["yarn"]
CMD ["start"]

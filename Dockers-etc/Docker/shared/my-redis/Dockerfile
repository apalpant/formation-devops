# 1 - Precisez l'image
FROM alpine:3.12

# 2 - Installation de redis
RUN apk add --update redis

RUN apk add bash

# 3 - Commande au demarrage
CMD ["redis-server"]
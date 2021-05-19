# 1 - Precisez l'image
FROM php:8.0.6-alpine3.12

# 2 - Update de l'image
RUN apk add --update

# 3 - Copie de hello.php
COPY hello.php .

# 4 - Commande au demarrage
CMD ["php", "hello.php" ]
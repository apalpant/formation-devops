# 1 - Precisez l'image
FROM alpine:3.13.5

# 2 - Installation de git
RUN apk add --update git

# 2 - Installation de curl
RUN apk add curl

# 3 - Commandes au demarrage
CMD git --version; curl --version | grep curl; echo "Container pret"

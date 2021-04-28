#!/bin/sh

echo "Installation reussie"

ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa <<<y 2>&1 >/dev/null

ssh-copy-id -i ~/.ssh/id_rsa.pub userjob@192.168.0.42
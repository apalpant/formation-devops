#!/bin/sh

# On installe l'utilitaire dos2unix
apt install dos2unix

dos2unix /home/vagrant/automatisation.sh


#!/bin/sh

export TOKEN=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
export CANAL_BOT=C021E7L6MG8
export BOT_SLACK_TOKEN=xoxb-1883936723840-2024390792898-abmLXO6gVdmJpoV8679zuDH7

# On installe l'utilitaire dos2unix
apt install dos2unix

dos2unix /home/vagrant/shared/automatisation.sh
chmod +x /home/vagrant/shared/automatisation.sh

apt install -y python3 
apt install -y python3-pip
apt install -y python3-dev

python3 -m pip install pymongo
python3 -m pip install flask

# https://docs.mongodb.com/manual/tutorial/install-mongodb-on-debian/

apt-get install gnupg

wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -

echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.4 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

apt-get update

apt-get install -y mongodb-org

systemctl start mongod


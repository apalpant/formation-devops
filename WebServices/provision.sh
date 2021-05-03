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
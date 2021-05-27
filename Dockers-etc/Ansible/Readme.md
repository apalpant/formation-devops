master 	192.168.33.110
target1 192.168.33.100
target2 192.168.33.102

Pour les 2 targets => 
sed -i "s/.*PasswordAuthentication.*/PasswordAuthentication no/g" /etc/ssh/sshd_config

Penser au droit 600 pour les cles.

ansible target2 -i targets.txt -m ping

ansible-playbook test-playbook.yml -i targets.txt

cat /etc/group => list group
cat /etc/passwd => list user

https://lecrabeinfo.net/se-connecter-en-ssh-a-un-serveur-distant-windows.html

ansible-playbook apache-deploy/playbook.yml -i targets.txt --tags copy

On peut faire des groupes de groupes dans le inventory

https://discuss.openedx.org/t/failed-to-update-apt-cache-problem-while-installing-edx-notes-in-ubuntu-16-04/745/7

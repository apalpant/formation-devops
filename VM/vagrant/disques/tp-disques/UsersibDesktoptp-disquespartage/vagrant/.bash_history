ls
touch tp.sh
chmod +x tp.sh 
nano tp.sh 
./tp.sh 
ls /var/lib
ls /var/lib/jenkins/secrets
sudo ls /var/lib/jenkins/secrets
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
sudo cat /etc/sudoers
nano tp.sh 
rm tp.sh 
touch tp.sh
chmod +x tp.sh 
nano tp.sh 
./tp.sh 
sudo cat /etc/sudoers
mkdir -p myinstall/DEBIAN
mkdir -p myinstall/usr/bin
mkdir -p myinstall/usr/share/doc
touch myinstall/DEBIAN/control
nano myinstall//DEBIAN/control 
ls
cp tp.sh myinstall/usr/bin/
ls myinstall/usr/bin/
gpg --gen-key
mkdir -p {conf,incoming}
nano conf/distributions
dpkg-sig --sign builder incoming/myinstall.deb
sudo apt install dpkg-sig
dpkg-sig --sign builder incoming/myinstall.deb
sudo apt install dpkg-deb
sudo apt-get install dpkg-deb
sudo dpkg-deb --build myinstall
dpkg-sig --sign builder incoming/myinstall.deb
ls
cp myinstall.deb incoming/
dpkg-sig --sign builder incoming/myinstall.deb
export GPG_TTY=$(tty)
dpkg-sig --sign builder incoming/myinstall.deb
logout
ls /tmp/
logout
ls
pwd
ls partage/
cp incoming/myinstall.deb partage/
ls
scp 

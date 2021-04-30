# Readme

Il faut lancer la commande 
> vagrant up

Et attendre...  Cela va construire toutes les VM du tp à la suite. 
Ci dessous le schéma des interactions entre les différentes VM et les différents fichiers/dossiers.

```mermaid
graph LR
VF[Vagrant File] -- Construit 192.168.1.1 --> NFS((Serveur NFS)) 
NFS -- Utilise --> PNFS((+ provision_server-nfs.sh<br/>+ dossier scripts pour creer .deb))

VF -- Construit 192.168.1.2 --> SW((Serveur Web))
SW -- Utilise --> PSW((+ provision_server-web.sh<br/>+ dossier share pour l'index.html<br/>+ sauvegarde.sh<br/>+ suppression.sh))



VF -- Construit 192.168.1.3 --> J((Jenkins))
J -- Utilise --> PJ((+ provision_jenkins.sh<br/>+ sauvegarde.sh<br/>+ suppression.sh))

SW -- Sauvegarde/Supprime --> NFS
J -- Sauvegarde/Supprime --> NFS

VF -- Construit x 3 192.168.1.2X --> Dev((Poste de devs))
Dev -- Utilise --> PDev((+ provision_poste-dev.sh))

Dev-- Deploie clefs ssh --> J
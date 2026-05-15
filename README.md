# Inception-of-Things

il faut que tu aies Vagrant et virtualbox installe dans ton ordi.
`sudo apt update`
`sudo apt install -y vagrant virtualbox`

`vagrant --version`
`VBoxManage --version`

```bash
mkdir -p /sgoinfre/goinfre/Perso/LOGIN
chmod 700 /sgoinfre/goinfre/Perso/LOGIN```

VirtualBox → Nouvelle
  Nom       : iot-dev
  Type      : Linux / Ubuntu 64-bit
  RAM       : 4096 Mo minimum (tu vas faire tourner des VMs dedans)
  CPU       : 2 minimum
  Disque    : 50 Go (K3s + images Docker prennent de la place)

Paramètres de la VM → Système → Processeur
→ Cocher "Activer VT-x/AMD-V imbriqué"

Fix — VM éteinte, dans VirtualBox
Paramètres de la VM iot-dev
→ Affichage
→ Écran
→ Décocher "Activer l'accélération 3D"
Et pendant que tu es là, vérifie aussi :
→ Contrôleur graphique : passer de "VMSVGA" à "VBoxVGA"

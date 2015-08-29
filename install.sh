#!/bin/bash
#Do all the stuff I do on a new install

DISTRO=""

# Show distro options and select distro
function chooseDistro {
  echo "==============================================================="
  echo "===             Choose your current Distro                  ==="
  echo "---------------------------------------------------------------"
  echo "-         Options:                                            -"
  echo "-                 u) Ubuntu * default                         -"
  echo "-                uS) Ubuntu server                            -"
  echo "-                 q) Quit                                     -"
  echo "---------------------------------------------------------------"
  echo -n "Choose an option: [U/q] "
  read choice
  case $choice in
    "u"|"U"|""|" " )
      DISTRO="ubuntu"
      runDistroScripts ;;
    "u"|"U" )
      DISTRO="ubuntuServer"
      runDistroScripts ;;
    "q"|"Q" )
      exit 0 ;;
      * )
      chooseDistro;
  esac
}

# run needed scripts for that distro
function runDistroScripts {
  case $DISTRO in
    "ubuntu" )
      ./distros/ubuntu/install_packages.sh
      copy ;;
    "ubuntuServer" )
      ./distros/ubuntu/server_install.sh
    *)
    chooseDistro;
  esac
}

# copy over the dotfiles
function copy {
  echo "Running the dotfiles copy script..."
  ./copy.sh
  echo ""
  exit
}

chooseDistro
exit

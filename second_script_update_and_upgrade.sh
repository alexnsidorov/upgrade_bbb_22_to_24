#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

echo "1. Insert repository"

sudo cat > /etc/apt/sources.list << HERE
# See http://help.ubuntu.com/community/UpgradeNotes for how to upgrade to
# newer versions of the distribution.
deb http://archive.ubuntu.com/ubuntu bionic main restricted
# deb-src http://archive.ubuntu.com/ubuntu bionic main restricted

## Major bug fix updates produced after the final release of the
## distribution.
deb http://archive.ubuntu.com/ubuntu bionic-updates main restricted
# deb-src http://archive.ubuntu.com/ubuntu bionic-updates main restricted

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team. Also, please note that software in universe WILL NOT receive any
## review or updates from the Ubuntu security team.
deb http://archive.ubuntu.com/ubuntu bionic universe
# deb-src http://archive.ubuntu.com/ubuntu bionic universe
deb http://archive.ubuntu.com/ubuntu bionic-updates universe
# deb-src http://archive.ubuntu.com/ubuntu bionic-updates universe

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team, and may not be under a free licence. Please satisfy yourself as to
## your rights to use the software. Also, please note that software in
## multiverse WILL NOT receive any review or updates from the Ubuntu
## security team.
deb http://archive.ubuntu.com/ubuntu bionic multiverse
# deb-src http://archive.ubuntu.com/ubuntu bionic multiverse
deb http://archive.ubuntu.com/ubuntu bionic-updates multiverse
# deb-src http://archive.ubuntu.com/ubuntu bionic-updates multiverse

## N.B. software from this repository may not have been tested as
## extensively as that contained in the main release, although it includes
## newer versions of some applications which may provide useful features.
## Also, please note that software in backports WILL NOT receive any review
## or updates from the Ubuntu security team.
deb http://archive.ubuntu.com/ubuntu bionic-backports main restricted universe multiverse
# deb-src http://archive.ubuntu.com/ubuntu bionic-backports main restricted universe multiverse

## Uncomment the following two lines to add software from Canonical's
## 'partner' repository.
## This software is not part of Ubuntu, but is offered by Canonical and the
## respective vendors as a service to Ubuntu users.
# deb http://archive.canonical.com/ubuntu bionic partner
# deb-src http://archive.canonical.com/ubuntu bionic partner

deb http://archive.ubuntu.com/ubuntu bionic-security main restricted
# deb-src http://archive.ubuntu.com/ubuntu bionic-security main restricted
deb http://archive.ubuntu.com/ubuntu bionic-security universe
# deb-src http://archive.ubuntu.com/ubuntu bionic-security universe
deb http://archive.ubuntu.com/ubuntu bionic-security multiverse
# deb-src http://archive.ubuntu.com/ubuntu bionic-security multiverse
HERE

echo "2. update and upgrade package"
apt update && apt upgrade -y && apt autoremove -y

echo "3. reboot"
reboot
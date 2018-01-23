#!/bin/bash

# apt-get upgrade
read -p "update e upgrade (y/n)? " CONT
if [ "$CONT" = "y" ]; then
  sudo apt-get update && sudo apt-get upgrade &&\
  notify-send "update and upgrade done";
else
  echo "ok, no upgrade"; 
fi


# youtube-dl

if youtube-dl --version >/dev/null 2>&1; then
    echo "youtube-dl installed already. Good"
else
    read -p "install youtube-dl (y/n)?" CONT
	if [ "$CONT" = "y" ]; then
		sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl &&\
		sudo chmod a+rx /usr/local/bin/youtube-dl &&\
		notify-send "youtube-dl installed";
	else
		echo "ok, no youtube-dl"; 
	fi
fi


# syncthing
script/syncthing.sh;

# electron

if electron --version >/dev/null 2>&1; then
    echo "Electron is installed already. Good"
else
    read -p "install Electron (y/n)? " CONT
	if [ "$CONT" = "y" ]; then
		reap -p "[s]ystem wide or just in a [f]older? "
		if [ "$CONT" = "s" ]; then
			sudo apt-get install python3-pyqt5 python3-setuptools &&\
			wget https://github.com/fyookball/electrum/archive/master.zip &&\
			unzip master.zip &&\
			sudo python3 electrum-master/setup.py install
			notify-send "Electron installed";
		elif
			[ "$CONT" = "f" ]; then
			sudo apt-get install python3-pyqt5 &&\
			wget https://github.com/fyookball/electrum/archive/master.zip &&\
			unzip master.zip &&\
			echo -e "Electron installed" &&\
			notify-send "Electron installed";
		else :
		fi
	fi
fi


# touchegg

read -p "Install touchegg (y/n)? " CONT
if [ "$CONT" = "y" ]; then
  sudo apt-get install build-essential libqt4-dev libgeis-dev libx11-6 libxtst-dev &&\
  wget https://github.com/JoseExposito/touchegg/archive/master.zip &&\
  unzip master.zip &&\
  pushd touchegg-master/ &&\
  qmake && make && make install &&\
  popd &&\
  echo -e "touchegg installed" &&\
  notify-send "touchegg installed";
else
  echo "ok, no touchegg"; 
fi


# OBmenu-generator
if obmenu-generator -v >/dev/null 2>&1; then
    echo "obmenu-generator installed already. Good"
else
read -p "Install obmenu-generator (y/n)?" CONT
if [ "$CONT" = "y" ]; then
  script/obmenu.sh 
else
  echo "ok, no ob-menu generator"; 
fi
fi

#!/bin/bash


# Install syncthing

if syncthing --version >/dev/null 2>&1; then
    echo "syncthing installed already. Good"
else
    read -p "install syncthing (y/n)?" CONT
	if [ "$CONT" = "y" ]; then
		curl -s https://syncthing.net/release-key.txt | sudo apt-key add - &&\ 
		echo "deb http://apt.syncthing.net/ syncthing release" | sudo tee /etc/apt/sources.list.d/syncthing.list &&\
		sudo apt-get update && sudo apt-get install syncthing &&\
		notify-send "syncthing installed";
	else
		echo "ok, no syncthing"; 
	fi
fi


# ripristiniamo
if syncthing --version >/dev/null 2>&1; then
  echo -e "This are the syncthing IDs, in case\n";
  echo -e "\nPi: 7OJMDXK-CEQFCX7-STRMKAQ-YJDETUF-GU6XHXH-VOM32XP-M236F2G-VHZUKA2";
  echo -e "cuoredoro : B5I4EWM-VPYKEQZ-HOY3LET-C4TVZ36-PT7RKC6-V6KWPFG-OBGESYF-OJBAKA7";
  echo -e "cubie: UOTGBBP-JQ52LW4-45GDYYO-XLMJE3I-WU22YZE-HXHTZHD-T5ZK3J7-H6K6AA3";
  echo -e "piccolino : Y24GSEN-56MCXSQ-BAZJVSD-OKLWR6E-3EF4HNF-VQQH3PQ-3QZEHWM-MAQO7QN";
else
:
fi



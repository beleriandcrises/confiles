#!/bin/bash

sudo apt-get install cpanminus gexec libcpan-distnameinfo-perl libcpan-meta-check-perl libfile-pushd-perl liblocal-lib-perl libmodule-cpanfile-perl libparse-pmfile-perl libstring-shellquote-perl libdata-dump-perl && \
wget https://github.com/trizen/obmenu-generator/archive/master.zip && \
unzip master.zip &&
sudo cp obmenu-generator-master/obmenu-generator /usr/bin && \
sudo chmod 755 /usr/bin/obmenu-generator &&\
mkdir ~/.config/obmenu-generator &&\
echo -e "remember to to set\n\n install Linux::DesktopFiles\n" &&\
perl -MCPAN -e shell;

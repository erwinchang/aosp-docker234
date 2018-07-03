FROM ubuntu:12.04

MAINTAINER Erwin "m9207216@gmail.com"

#https://source.android.com/setup/build/initializing
#Installing required package (Ubuntu 12.04)
#sudo apt-get install git gnupg flex bison gperf build-essential zip curl libc6-dev libncurses5-dev:i386 x11proto-core-dev libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown libxml2-utils xsltproc zlib1g-dev:i386
#sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so

RUN linux32 sed -i 's/archive.ubuntu.com/ubuntu.stu.edu.tw/g' /etc/apt/sources.list
RUN echo "APT::Install-Recommends 0;" >> /etc/apt/apt.conf.d/01norecommends \
 && echo "APT::Install-Suggests 0;" >> /etc/apt/apt.conf.d/01norecommends \
 && apt-get update -y \
 && apt-get install -y git gnupg flex bison gperf build-essential zip curl libc6-dev libncurses5-dev:i386 x11proto-core-dev libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown libxml2-utils xsltproc zlib1g-dev:i386 \
 && apt-get install -y libsdl-dev \
 && apt-get install -y libesd0-dev \
 && apt-get install -y libwxgtk2.6-dev \
 && apt-get install -y uboot-mkimage \
 && apt-get install -y expect \
 && apt-get install -y imagemagick \
 && apt-get install -y vim.tiny wget \
#fix ld cannot found -lz -lncurses
 && apt-get install -y lib32z1 lib32z1-dev lib32ncurses5 lib32ncurses5-dev \
 && apt-get install -y unzip \
 && apt-get install -y openjdk-6-jdk \
 && apt-get install -y fakeroot \
 && apt-get install -y sudo \
 && rm -rf /var/lib/apt/lists/*

# All builds will be done by user aosp
COPY gitconfig /root/.gitconfig
COPY ssh_config /root/.ssh/config

#bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

VOLUME ["/mnt/ssd1", "/mnt/aosp","/mnt/ssd2"]

WORKDIR /mnt/aosp

COPY utils/docker_entrypoint.sh /root/docker_entrypoint.sh
RUN chmod +x /root/docker_entrypoint.sh
ENTRYPOINT ["/root/docker_entrypoint.sh"]

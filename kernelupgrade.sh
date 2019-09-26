#!/bin/bash

# Description: This script is written to patch your kernel's system version.

# Author: Staline Ngoma

# Date: 07/06/2019

clear

echo "Your Kernel's System Is Going To Be Upgraded. Just grab a cup of coffee, sit down and relax"

sleep 6

echo "Checking the current kernel version"

echo

uname -r

sleep 4

echo "Starting To Download a Package From Kernel.org!!!"

sleep 3

# wget http://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.1.16.tar.xz

clear

echo "unataring the package"

sleep 4

echo

tar xfv linux-5.1.16.tar.xz 

clear

sleep 3

echo "Moving Into The untared Package From kernel.org!!!"

sleep 3

cd linux-5.1.16

clear

echo "Downloading The Development Tools And The Dependencies!!!"

sleep 3

echo

yum groupinstall "Development Tools" -y

clear

yum install openssl* -y

clear

yum install ncurses-devel -y

clear

yum install elfutils-libelf-devel -y

clear

yum install gcc* -y

clear

yum install centos-release-scl -y

clear

sleep 3

echo "Enabling The scl rpms package!!!"

sleep 3

yum-config-manager --enable rhel-server-rhscl-7-rpms

sleep 3

echo "Installing the remain dependencies!!!"

echo

yum install devtoolset-7 -y

yum install devtoolset-7-gcc* -y

echo

echo "Enabling the devtoolset-7 for kernel compilation"

sleep 3

echo

source scl_source  enable devtoolset-7

echo

echo "Creating The default .config file to prepare the kernel compilation!!!"

make defconfig

echo

echo "Running the make commands!!!"

make

clear

make modules

clear

make modules_install

clear

make install

clear

echo "Configuring the new kernel's system version as default!!!"

clear

echo

sed -i 's/default=1/default=0/g' /boot/grub/grub.conf

clear

echo "Now, all is set. The new kernel's system version has been installed and the version is:"

uname -r

echo

echo "This is compared to the old one that was 2.6.32-358.el6.x86_64"

sleep 4

echo "rebooting the sytem in six seconds!!!"

sleep 6

#init 6

exit 0

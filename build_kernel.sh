#!/bin/bash
clear
export ARCH=arm64
export PLATFORM_VERSION=13
export ANDROID_MAJOR_VERSION=t
ln -s /usr/bin/python2.7 $HOME/bin/python
export PATH=$HOME/bin/:$PATH

ARGS='
CC=/home/federico/Projects/clang-4639204/bin/clang
CROSS_COMPILE=/home/federico/Projects/Toolchains_for_Snapdragon/aarch64-linux-android-4.9/bin/aarch64-linux-android-
CLANG_TRIPLE=aarch64-linux-gnu-
ARCH=arm64
'

make ${ARGS} clean && make ${ARGS} mrproper #to clean the source
make ${ARGS} exynos9610-gta4xlxx_defconfig #making your current kernel config
#make ${ARGS} menuconfig
make ${ARGS} -j2 #to compile the kernel

#to copy all the kernel modules (.ko) to "modules" folder.
mkdir -p modules
find . -type f -name "*.ko" -exec cp -n {} modules \;
echo "Module files copied to the 'modules' folder."

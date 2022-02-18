#!/bin/bash

echo
echo "Clean Build Directory"
echo 

make clean && make mrproper

echo
echo "Issue build commands"
echo

mkdir -p out
export CLANG_PATH=/home/kristof/android/clang/bin
export PATH=${CLANG_PATH}:${PATH}
export CROSS_COMPILE=/home/kristof/android/binutils/bin/aarch64-linux-gnu-

echo
echo "Set DEFCONFIG"
echo 

time make LLVM=1 O=out aospa-oneplus9_defconfig

echo
echo "Build The Kernel"
echo 

time make LLVM=1 O=out -j12
find /home/kristof/aospa-sapphire/out/arch/arm64/boot/dts/vendor/qcom -name '*.dtb' -exec cat {} + > /home/kristof/aospa-sapphire/out/arch/arm64/boot/dtb
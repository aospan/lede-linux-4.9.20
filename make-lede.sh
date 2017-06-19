PATH=$PATH:/mnt/sdb/hdd2/src/ocp/lede/linux-4.9.20/../staging_dir/toolchain-arm_cortex-a9_gcc-5.4.0_musl_eabi/bin/ make ARCH=arm CROSS_COMPILE="arm-openwrt-linux-muslgnueabi-" -j 4 zImage

PATH=$PATH:/mnt/sdb/hdd2/src/ocp/lede/linux-4.9.20/../staging_dir/toolchain-arm_cortex-a9_gcc-5.4.0_musl_eabi/bin/ make ARCH=arm CROSS_COMPILE="arm-openwrt-linux-muslgnueabi-" -j 4 arch/arm/boot/dts/

cp ./arch/arm/boot/zImage edgecore-ecw7220-l-o-kernel.bin
cat ./arch/arm/boot/dts/bcm4708-edgecore-ecw7220-l-o.dtb  >> edgecore-ecw7220-l-o-kernel.bin

/mnt/sdb/hdd2/src/ocp/lede/staging_dir/host/bin/trx \
  -o /var/lib/tftpboot/lede-bcm53xx-edgecore-ecw7220-l-o-squashfs.trx -m \
  33554432 -f edgecore-ecw7220-l-o-kernel.bin -a 0x20000 -b 0x400000 \
  -f /mnt/sdb/hdd2/src/ocp/lede/build_dir/target-arm_cortex-a9_musl_eabi/linux-bcm53xx/tmp/lede-bcm53xx-edgecore-ecw7220-l-o-squashfs.trx \
  -A /mnt/sdb/hdd2/src/ocp/lede/build_dir/target-arm_cortex-a9_musl_eabi/linux-bcm53xx/ubi_mark -a 0x20000

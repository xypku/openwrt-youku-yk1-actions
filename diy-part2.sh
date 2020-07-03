#!/bin/bash
#=================================================
# Description: DIY script
# https://github.com/liuran001/Openwrt_MI-R3G_firmware
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# 这里的脚本在获取feeds后执行
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate
sed -i 's/\"#src-git\"/\"src-git\"/g' ./feeds.conf.default
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
#git clone https://github.com/kenzok8/openwrt-packages package/op-packages
#=================================================
#=================================================
# 获取luci-app-adguardhome
# git clone https://github.com/rufengsuixing/luci-app-adguardhome package/diy-packages/luci-app-adguardhome
git clone https://github.com/ujincn/luci-app-smartdns-compat.git package/luci-app-smartdns-compat
git clone https://github.com/pymumu/smartdns.git package/smartdns
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
# 获取hello world和依赖
git clone https://github.com/jerrykuku/lua-maxminddb package/diy-packages/helloworld/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr package/diy-packages/helloworld/luci-app-vssr
# 获取passwall
git clone -b 3.6-40 https://github.com/liuran001/luci-app-passwall package/diy-packages/passwall
# 获取Lienol-package
git clone https://github.com/Lienol/openwrt-package package/diy-packages/lienol

make && sudo make install
popd
#=================================================
# 清除默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
#=================================================
# 清除旧版argon主题并拉取最新版
pushd package/lean
rm -rf luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon luci-theme-argon
popd
#=================================================


# Modify target.mk
cd include
rm ./target.mk
wget https://raw.githubusercontent.com/xypku/openwrt-youku-yk1-actions/master/target.mk

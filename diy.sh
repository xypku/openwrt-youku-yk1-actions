#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================

# Modify default IP
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate
sed -i 's/\"#src-git\"/\"src-git\"/g' ./feeds.conf.default
git clone https://github.com/ujincn/luci-app-smartdns-compat.git package/luci-app-smartdns-compat
git clone https://github.com/pymumu/smartdns.git package/smartdns
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
#git clone https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-adguardhome
#git clone https://github.com/jefferymvp/luci-app-koolproxyR package/luci-app-koolproxyR
#git clone https://github.com/vernesong/OpenClash.git package/OpenClash
./scripts/feeds update -a
./scripts/feeds install -a

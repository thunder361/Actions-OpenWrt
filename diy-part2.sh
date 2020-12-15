#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

#添加server酱
git clone https://github.com/tty228/luci-app-serverchan.git package/lean/luci-app-serverchan

# 增加关机功能
git clone https://github.com/esirplayground/luci-app-poweroff.git package/lean/luci-app-poweroff

# 增加Smartdns
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

# 增加chinadns
git clone https://github.com/aa65535/openwrt-chinadns.git package/chinadns
git clone https://github.com/aa65535/openwrt-dist-luci.git package/openwrt-dist-luci

# 增加chinadns-ng
#git clone https://github.com/pexcn/openwrt-chinadns-ng.git package/chinadns-ng

# 获取luci-app-passwall以及缺失的依赖
pushd package/lean
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ssocks
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-go
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-plus
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/brook
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng
popd

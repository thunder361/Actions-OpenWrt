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

# 版本号里显示一个自己的名字
sed -i "s/OpenWrt /NagaseKouichi build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

#添加server酱
git clone https://github.com/tty228/luci-app-serverchan.git package/lean/luci-app-serverchan

# 增加关机功能
git clone https://github.com/esirplayground/luci-app-poweroff.git package/lean/luci-app-poweroff

# 增加Smartdns
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

# 增加chinadns
#git clone https://github.com/aa65535/openwrt-chinadns.git package/chinadns
#git clone https://github.com/aa65535/openwrt-dist-luci.git package/openwrt-dist-luci

# 增加chinadns-ng
#git clone https://github.com/NagaseKouichi/openwrt-chinadns-ng.git package/chinadns-ng
git clone -b luci https://github.com/NagaseKouichi/openwrt-chinadns-ng.git package/luci-app-chinadns-ng

# 获取luci-app-passwall以及缺失的依赖
pushd package/lean
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ssocks
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-go
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-plus
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/brook
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng
popd

# 使用Lienol https-dns-proxy版本
pushd feeds/packages/net
rm -fr https-dns-proxy && svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy
popd
pushd feeds/luci/applications
rm -fr luci-app-https-dns-proxy && svn co https://github.com/Lienol/openwrt-luci/branches/17.01/applications/luci-app-https-dns-proxy
popd

# pdnsd过滤ipv6
#mv $GITHUB_WORKSPACE/pdnsd-patch/* $GITHUB_WORKSPACE/openwrt/package/lean/pdnsd-alt/patches

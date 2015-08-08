#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
PKG_NAME:=arping
PKG_VERSION:=2015-05-25
PKG_RELEASE=$(PKG_SOURCE_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=git://github.com/ThomasHabets/arping.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=arping-2.15
PKG_MAINTAINER:=MK <mkoseoglu@drtek.com.tr>
PKG_LICENSE:=GPL-2.0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/arping
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Routing and Redirection
  TITLE:=Arping by MAC / TOOLS
endef
TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include
define Package/arping/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/arping $(1)/usr/sbin/arping
endef

$(eval $(call BuildPackage,arping))

EXPECT_VERSION = 5.45.3
EXPECT_SITE = https://sourceforge.net/projects/expect/files/Expect/$(EXPECT_VERSION)
EXPECT_SOURCE = expect$(EXPECT_VERSION).tar.gz
EXPECT_LICENSE = Public domain
EXPECT_LICENSE_FILES = README

EXPECT_AUTORECONF = YES
EXPECT_DEPENDENCIES = tcl
EXPECT_CONF_OPTS = --with-tcl=$(BUILD_DIR)/tcl-$(TCL_VERSION)/unix

EXPECT_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-binaries

$(eval $(autotools-package))

################################################################################
#
# skiff-core-defconfig
#
################################################################################

SKIFF_CORE_DEFCONFIG_DEPENDENCIES = skiff-core

define SKIFF_CORE_DEFCONFIG_INSTALL_COREENV
	mkdir -p $(TARGET_DIR)/opt/skiff/coreenv/base
	cp -r $(SKIFF_CORE_DEFCONFIG_PKGDIR)/coreenv/* $(TARGET_DIR)/opt/skiff/coreenv/base
	$(INSTALL) -m 0644 $(SKIFF_CORE_DEFCONFIG_PKGDIR)/coreenv-defconfig.yaml \
		$(TARGET_DIR)/opt/skiff/coreenv/defconfig.yaml
endef

SKIFF_CORE_DEFCONFIG_POST_INSTALL_TARGET_HOOKS += SKIFF_CORE_DEFCONFIG_INSTALL_COREENV

define SKIFF_CORE_DEFCONFIG_INSTALL_LOCALE_TOOL
	if [ ! -x $(TARGET_DIR)/usr/bin/locale ] && [ -x $(STAGING_DIR)/usr/bin/locale ]; then \
		$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/bin/locale \
			$(TARGET_DIR)/usr/bin/locale; \
	fi
endef

SKIFF_CORE_DEFCONFIG_POST_INSTALL_TARGET_HOOKS += SKIFF_CORE_DEFCONFIG_INSTALL_LOCALE_TOOL

$(eval $(generic-package))

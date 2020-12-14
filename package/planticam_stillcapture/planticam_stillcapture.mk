PLANTICAM_STILLCAPTURE_VERSION = 1.0
PLANTICAM_STILLCAPTURE_SITE =
PLANTICAM_STILLCAPTURE_SOURCE =
PLANTICAM_STILLCAPTURE_LICENSE = BSD-3-Clause
PLANTICAM_STILLCAPTURE_LICENSE_FILES = LICENSE
PLANTICAM_STILLCAPTURE_DEST_DIR = /opt/planticam_stillcapture
#PLANTICAM_STILLCAPTURE_SITE_METHOD = git
PLANTICAM_STILLCAPTURE_INIT_SYSTEMD_TARGET = basic.target.wants

define PLANTICAM_STILLCAPTURE_BUILD_CMDS
	# $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)
endef

define PLANTICAM_STILLCAPTURE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)$(PLANTICAM_STILLCAPTURE_DEST_DIR)

	$(INSTALL) -d -D -m 0755 $(PLANTICAM_STILLCAPTURE_PKGDIR)picamera $(TARGET_DIR)$(PLANTICAM_STILLCAPTURE_DEST_DIR)/picamera
	$(INSTALL) -D -m 0755 $(PLANTICAM_STILLCAPTURE_PKGDIR)picamera/* $(TARGET_DIR)$(PLANTICAM_STILLCAPTURE_DEST_DIR)/picamera/
	cp -r $(PLANTICAM_STILLCAPTURE_PKGDIR)exifread $(TARGET_DIR)$(PLANTICAM_STILLCAPTURE_DEST_DIR)/exifread
	$(INSTALL) -D -m 0755 $(PLANTICAM_STILLCAPTURE_PKGDIR)capture.py $(TARGET_DIR)$(PLANTICAM_STILLCAPTURE_DEST_DIR)
endef

define PLANTICAM_STILLCAPTURE_INSTALL_INIT_SYSTEMD
	mkdir -p $(TARGET_DIR)/etc/systemd/system/$(PLANTICAM_STILLCAPTURE_INIT_SYSTEMD_TARGET)
	$(INSTALL) -D -m 644 $(PLANTICAM_STILLCAPTURE_PKGDIR)planticam_still.service $(TARGET_DIR)/usr/lib/systemd/system/planticam_sill.service
endef

$(eval $(generic-package))

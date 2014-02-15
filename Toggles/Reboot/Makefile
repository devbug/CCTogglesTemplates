ARCHS = armv7 armv7s arm64
SDKVERSION = 7.0

include theos/makefiles/common.mk

BUNDLE_NAME = Reboot
Reboot_FILES = Toggle.xm
Reboot_FRAMEWORKS = UIKit
Reboot_INSTALL_PATH = /Library/Application Support/CCToggles/Toggles

include $(THEOS_MAKE_PATH)/bundle.mk


FW_DEVICE_IP = 192.168.1.9

ri:: remoteinstall
remoteinstall:: all internal-remoteinstall after-remoteinstall
internal-remoteinstall::
	ssh root@$(FW_DEVICE_IP) "mkdir -p \"$(Reboot_INSTALL_PATH)/$(BUNDLE_NAME).bundle/\""
	scp "$(FW_PROJECT_DIR)/${THEOS_OBJ_DIR_NAME}/$(BUNDLE_NAME).bundle/${BUNDLE_NAME}" root@$(FW_DEVICE_IP):"\"$(Reboot_INSTALL_PATH)/$(BUNDLE_NAME).bundle/\""
	scp "$(FW_PROJECT_DIR)/Resources/Info.plist" root@$(FW_DEVICE_IP):"\"$(Reboot_INSTALL_PATH)/$(BUNDLE_NAME).bundle/\""
after-remoteinstall::


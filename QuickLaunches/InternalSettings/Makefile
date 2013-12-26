ARCHS = armv7 armv7s
TARGET = iphone:clang::7.0
SDKVERSION = 7.0

include theos/makefiles/common.mk

BUNDLE_NAME = InternalSettings
InternalSettings_FILES = Toggle.xm
InternalSettings_INSTALL_PATH = /Library/Application Support/CCToggles/QuickLaunches

ADDITIONAL_CFLAGS = -I../../

include $(THEOS_MAKE_PATH)/bundle.mk


FW_DEVICE_IP = 192.168.1.4

ri:: remoteinstall
remoteinstall:: all internal-remoteinstall after-remoteinstall
internal-remoteinstall::
	ssh root@$(FW_DEVICE_IP) "mkdir -p \"$(InternalSettings_INSTALL_PATH)/$(BUNDLE_NAME).bundle/\""
	scp "$(FW_PROJECT_DIR)/${THEOS_OBJ_DIR_NAME}/$(BUNDLE_NAME).bundle/${BUNDLE_NAME}" root@$(FW_DEVICE_IP):"\"$(InternalSettings_INSTALL_PATH)/$(BUNDLE_NAME).bundle/\""
	scp "$(FW_PROJECT_DIR)/Resources/Info.plist" root@$(FW_DEVICE_IP):"\"$(InternalSettings_INSTALL_PATH)/$(BUNDLE_NAME).bundle/\""
after-remoteinstall::


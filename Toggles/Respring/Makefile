ARCHS = armv7 armv7s
TARGET = iphone:clang::7.0
SDKVERSION = 7.0

include theos/makefiles/common.mk

BUNDLE_NAME = Respring
Respring_FILES = Toggle.xm
Respring_INSTALL_PATH = /Library/Application Support/CCToggles/Toggles

ADDITIONAL_CFLAGS = -I../../

include $(THEOS_MAKE_PATH)/bundle.mk


FW_DEVICE_IP = 192.168.1.4

ri:: remoteinstall
remoteinstall:: all internal-remoteinstall after-remoteinstall
internal-remoteinstall::
	scp "$(FW_PROJECT_DIR)/${THEOS_OBJ_DIR_NAME}/$(BUNDLE_NAME).bundle/${BUNDLE_NAME}" root@$(FW_DEVICE_IP):"\"$(Respring_INSTALL_PATH)/$(BUNDLE_NAME).bundle/\""
	scp "$(FW_PROJECT_DIR)/Resources/Info.plist" root@$(FW_DEVICE_IP):"\"$(Respring_INSTALL_PATH)/$(BUNDLE_NAME).bundle/\""
after-remoteinstall::


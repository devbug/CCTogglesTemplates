ARCHS = armv7
TARGET = iphone:clang::7.0
SDKVERSION = 7.0

include @@THEOS@@/makefiles/common.mk

BUNDLE_NAME = @@PROJECTNAME@@
@@PROJECTNAME@@_FILES = Toggle.xm
@@PROJECTNAME@@_INSTALL_PATH = /Library/Application Support/CCToggles/Toggles

include $(THEOS_MAKE_PATH)/bundle.mk


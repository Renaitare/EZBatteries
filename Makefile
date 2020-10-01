export ARCHS = arm64 arm64e
export TARGET = iphone:clang:14.0:10.0

# Unfortunately needed :(
GO_EASY_ON_ME = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = EZBatteries
EZBatteries_FILES = src/EZBatteries/EZBatteries.xm
EZBatteries_EXTRA_FRAMEWORKS += Cephei

include $(THEOS)/makefiles/tweak.mk

internal-stage::
	mkdir -p "$(THEOS_STAGING_DIR)/Library/EZBatteries"
	cp assets/Resources/* "$(THEOS_STAGING_DIR)/Library/EZBatteries"

after-install::
	install.exec "killall -9 SpringBoard"

SUBPROJECTS += src/EZBatteriesPrefs
include $(THEOS)/makefiles/aggregate.mk

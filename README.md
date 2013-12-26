#CCToggles

##Toggle and QuickLaunch template


###Files

<pre>
CCTogglesAgent.h
nic/
	cctoggle_toggle.nic/
	cctoggle_toggle.nic.tar
QuickLaunches/
	AppSwitcher/
    InternalSettings/
Toggles/
	Respring/
</pre>


<br />

#####THEOS nic
You can use THEOS nic template.<br />
Copy `nic/cctoggle_toggle.nic.tar` into `$THEOS/templates/iphone/`<br />
And you can make CCToggles bundle by this command:<br />
~~~
$THEOS/bin/nic.pl
~~~

<br />

#####Examples
CCToggles has two sections.<br />
*Toggles* and *QuickLaunches*.<br />
<br />
They have just two differents.<br />
`Resources/Info.plist` and<br />
`Makefile`.
<br />
<br />

This is Toggle's `Resources/Info.plist`.
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleDevelopmentRegion</key>
	<string>English</string>
	<key>CFBundleExecutable</key>
	<string>Respring</string>
	<key>CFBundleIdentifier</key>
	<string>me.devbug.cctoggle.respring</string>
	<key>CFBundleDisplayName</key>
	<string>Respring</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
	<key>CFBundlePackageType</key>
	<string>BNDL</string>
	<key>CFBundleShortVersionString</key>
	<string>1.0.0</string>
	<key>CFBundleSignature</key>
	<string>????</string>
	<key>CFBundleVersion</key>
	<string>1.0</string>
	<key>DTPlatformName</key>
	<string>iphoneos</string>
	<key>MinimumOSVersion</key>
	<string>7.0</string>
	<key>NSPrincipalClass</key>
	<string>RespringCCToggle</string>
	<key>type</key>
	<string>Toggle</string>
	<key>wantsControlCenterDismissal</key>
	<false/>
</dict>
</plist>
```

<br /><br />
And this is QuickLaunch's `Resources/Info.plist`.
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleDevelopmentRegion</key>
	<string>English</string>
	<key>CFBundleExecutable</key>
	<string>AppSwitcher</string>
	<key>CFBundleIdentifier</key>
	<string>me.devbug.cctoggle.ql.appswitcher</string>
	<key>CFBundleDisplayName</key>
	<string>AppSwitcher</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
	<key>CFBundlePackageType</key>
	<string>BNDL</string>
	<key>CFBundleShortVersionString</key>
	<string>1.0.0</string>
	<key>CFBundleSignature</key>
	<string>????</string>
	<key>CFBundleVersion</key>
	<string>1.0</string>
	<key>DTPlatformName</key>
	<string>iphoneos</string>
	<key>MinimumOSVersion</key>
	<string>7.0</string>
	<key>NSPrincipalClass</key>
	<string>AppSwitcherCCToggle</string>
	<key>type</key>
	<string>QuickLaunch</string>
	<key>wantsControlCenterDismissal</key>
	<true/>
</dict>
</plist>
```

<br /><br />
If you make Toggle, you take care of these keys.<br />
<br />
`type` and `wantsControlCenterDismissal`.<br />
<br />
First of all, Toggle's `wantsControlCenterDismissal` is always *false*.<br />
If you make QuickLaunch, you can set what you want.<br />
`wantsControlCenterDismissal` means *dismiss or not ControlCenter when you tap quicklaunch*.<br />
<br />
And `type` is just two values.<br />
*Toggle* and *QuickLaunch*.<br />
This is not important value.<br />
<br />
<br />
*****************************************************************
<br />
<br />
This is Toggle's `Makefile`.
```
ARCHS = armv7 armv7s
TARGET = iphone:clang::7.0
SDKVERSION = 7.0

include theos/makefiles/common.mk

BUNDLE_NAME = Respring
Respring_FILES = Toggle.xm
Respring_INSTALL_PATH = /Library/Application Support/CCToggles/Toggles

include $(THEOS_MAKE_PATH)/bundle.mk
```
<br />
And this is QuickLaunch's.
```
ARCHS = armv7 armv7s
TARGET = iphone:clang::7.0
SDKVERSION = 7.0

include theos/makefiles/common.mk

BUNDLE_NAME = AppSwitcher
AppSwitcher_FILES = Toggle.xm
AppSwitcher_INSTALL_PATH = /Library/Application Support/CCToggles/QuickLaunches
AppSwitcher_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/bundle.mk
```
<br /><br />
I think I don't need more description of Makefile. :)<br />
<br /><br />
********************************************************************
<br /><br />
#####Icons
You should put icons at least two.<br />
For iPad 2 and iPad Mini<br />
`Icon.png`<br />
For iPhone 4/4s/5/5c/5s, iPod touch 5G, iPad 3/4/Air/Mini Retina<br />
`Icon@2x.png`<br />
<br />
And if you want to set 'on' state icon, you should put one more pair.<br />
`Icon_on.png` and `Icon_on@2x.png`.<br />
<br />
<br /><br />
********************************************************************
<br /><br />
#####Localizations
Please see `Respring` Toggle's source code and *Resources* folder.<br />
<br /><br />




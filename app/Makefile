

all: app

app:
	$$NDK_PATH/ndk-build
	$$ADT_BUNDLE/sdk/tools/android update project -p ./ --target 1 --subprojects
	ant debug
	# uninstall like:
	# $$ADT_BUNDLE/sdk/platform-tools/adb uninstall com.springmeyer.hello
	$$ADT_BUNDLE/sdk/platform-tools/adb install -r bin/MainActivity-debug.apk

clean:
	rm -rf {bin,gen,libs,obj,res}
	rm -f proguard-project.txt
	rm -f project.properties
	rm -f build.xml
	rm -f local.properties

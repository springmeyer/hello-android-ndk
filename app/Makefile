

all: app

app:
	$$NDK_PATH/ndk-build
	$$ADT_BUNDLE/sdk/tools/android update project -p ./ --target 1 --subprojects
	ant debug

clean:
	rm -rf {bin,gen}
	rm -f proguard-project.txt
	rm -f project.properties
	rm -f build.xml
	rm -f local.properties

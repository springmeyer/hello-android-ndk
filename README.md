
## Hello world example for Android NDK + JNI app

## Depends

  - OSX host
  - Android r9c NDK (for building app)
  - Android ADT Bundle (for running app)


## Setup

Setup the NDK and environment for cross-compiling against NDK:

    curl -O http://dl.google.com/android/ndk/android-ndk-r9c-darwin-x86_64.tar.bz2
    tar -xf android-ndk-r9c-darwin-x86_64.tar.bz2
    export NDK_PATH=$(pwd)/android-ndk-r9
    export API_LEVEL="android-18"
    export ANDROID_CROSS_COMPILER="arm-linux-androideabi-4.8"
    export PLATFORM_PREFIX="${NDK_PATH}/active-platform/"
    # NOTE: make-standalone-toolchain.sh --help for options
    "${NDK_PATH}/build/tools/make-standalone-toolchain.sh"  \
      --toolchain="${ANDROID_CROSS_COMPILER}" \
      --install-dir="${PLATFORM_PREFIX}" \
      --stl=gnustl \
      --arch=arm \
      --platform="${API_LEVEL}"
    alias ldd="arm-linux-androideabi-readelf -d "
    export PATH="${PLATFORM_PREFIX}/bin":${PATH}
    export CXX="arm-linux-androideabi-g++"
    export CC="arm-linux-androideabi-gcc"
    export LD="arm-linux-androideabi-ld"
    export AR="arm-linux-androideabi-ar"
    export RANLIB="arm-linux-androideabi-ranlib"
    # TODO - some builds hardcode libtool which breaks since os x version is used (zlib)
    #alias libtool="arm-linux-androideabi-ar cru"
    #export libtool="arm-linux-androideabi-ar cru"
    export NM="arm-linux-androideabi-nm"

Setup the ADK:

    curl -O http://dl.google.com/android/adt/adt-bundle-mac-x86_64-20131030.zip
    unzip adt-bundle-mac-x86_64-20131030.zip
    ADT_BUNDLE="$(pwd)/adt-bundle-mac"
    export PATH=$(pwd)/../adt-bundle-mac/:$PATH
    export PATH="${ADT_BUNDLE}/sdk/tools:${ADT_BUNDLE}/sdk/platform-tools":${PATH}

TODO: describe cross compiling external library

Now build the JNI app:

    cd hello-android-ndk/app
    $NDK_PATH/ndk-build
    
    # create a build.xml
    android update project -p ./ --target 1 --subprojects
    ant debug
    
    # in another terminal start the simulator
    emulator -avd Phone & ddms
    
    # then back in the main terminal install to test on the app
    adb install -r bin/MainActivity-debug.apk


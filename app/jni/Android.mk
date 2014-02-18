LOCAL_PATH := $(call my-dir)

#Variables
ANDROID_NDK := ../android-ndk-r9c

include $(CLEAR_VARS)
#LOCAL_LDFLAGS := $(ANDROID_NDK)/sources/cxx-stl/gnu-libstdc++/4.8/libs/armeabi/libgnustl_static.a
LOCAL_MODULE := mylib
LOCAL_SRC_FILES := mylib.cpp
#LOCAL_CPPFLAGS := 
LOCAL_CPP_FEATURES := rtti exceptions
include $(BUILD_SHARED_LIBRARY)

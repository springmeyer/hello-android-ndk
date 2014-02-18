LOCAL_PATH := $(call my-dir)

#Variables
ANDROID_NDK := ../../android-ndk-r9

include $(CLEAR_VARS)
LOCAL_LDFLAGS := $(shell mapnik-config --libs --dep-libs) $(ANDROID_NDK)/sources/cxx-stl/gnu-libstdc++/4.6/libs/armeabi/libgnustl_static.a
LOCAL_MODULE := mylib
LOCAL_SRC_FILES := mylib.cpp
LOCAL_CPPFLAGS := $(shell mapnik-config --includes --defines --cxxflags)
LOCAL_CPP_FEATURES := rtti exceptions
include $(BUILD_SHARED_LIBRARY)

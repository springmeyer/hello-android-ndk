#include <string>
#include <jni.h>

extern "C" {

    JNIEXPORT jstring JNICALL Java_com_springmeyer_hello_android_ndk_MainActivity_stringFromJNI(JNIEnv *env, jobject  obj){
        std::string hello("hello");
        return env->NewStringUTF(hello.c_str());
    }

}

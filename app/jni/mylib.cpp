#include <string>
#include <jni.h>

extern "C" {

    JNIEXPORT jstring JNICALL Java_com_springmeyer_hello_MainActivity_stringFromJNI(JNIEnv *env, jobject  obj){
        #if defined(__arm__)
          #if defined(__ARM_ARCH_7A__)
            #if defined(__ARM_NEON__)
              #define ABI "armeabi-v7a/NEON"
            #else
              #define ABI "armeabi-v7a"
            #endif
          #else
           #define ABI "armeabi"
          #endif
        #elif defined(__i386__)
           #define ABI "x86"
        #elif defined(__mips__)
           #define ABI "mips"
        #else
           #define ABI "unknown"
        #endif
        std::string hello("Hello from JNI !  Compiled with ABI " ABI ".");
        return env->NewStringUTF(hello.c_str());
    }

}

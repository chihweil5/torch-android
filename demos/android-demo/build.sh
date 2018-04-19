~/Downloads/tools/android update project --path . --target android-27
ndk-build -v
if [ $? -ne 0 ]; then
    exit
fi
rm -rf assets/lua
mkdir -p libs/armeabi-v7a/ libs/arm64-v8a/
cp -r ../../install/share/lua assets/
cp -r ../../install/libs/armeabi-v7a/*.so libs/armeabi-v7a/
cp -r ../../install/libs/arm64-v8a/*.so libs/arm64-v8a/
ant debug
if [ $? -ne 0 ]; then
    exit
fi
adb install -r bin/TorchDemo-debug.apk
if [ $? -ne 0 ]; then
    exit
fi

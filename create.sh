if [ -d "out" ]; then
	rm -rf out/
fi

mkdir -p out/

echo "Building..."
./build/build.sh
echo "Done!\n"

echo "Creating magisk module..."
cp -r magisk-template/ module/
mkdir -p module/system/product/overlay/
cp out/*.apk module/system/product/overlay/
(cd module/ && zip -r $OLDPWD/out/magisk-module.zip .) >/dev/null
rm -rf module/
echo "Done!"

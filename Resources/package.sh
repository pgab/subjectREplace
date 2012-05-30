MB="$PRODUCT_NAME.$WRAPPER_EXTENSION"
PKG="$PRODUCT_NAME-$CURRENT_PROJECT_VERSION.pkg"
DEST="root/Library/Mail/Bundles/"


cd "$TARGET_BUILD_DIR"

# set the 'bundle' bit
/Developer/Tools/SetFile -a B $MB

mkdir -p $DEST
mv $MB $DEST

/Developer/usr/bin/packagemaker \
    --root root \
	--id "$PRODUCT_IDENTIFIER" \
	--title "$PRODUCT_NAME" \
	--domain user --scripts "$SRCROOT/Resources/Installer/Scripts" \
	--target 10.5 --version "$CURRENT_PROJECT_VERSION" \
	--out $PKG

mv $DEST/$MB .

rmdir -p $DEST


pkgutil --expand $PKG tmp
sed -i '' 's/ auth="[Rr]oot"//' tmp/Distribution tmp/*.pkg/PackageInfo
pkgutil --flatten tmp $PKG
rm -rf tmp/

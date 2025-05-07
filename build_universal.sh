#!/bin/bash

# Set working paths
SOURCE_DIR="build/out/all/zip"
UNIVERSAL_DIR="build/universal"
OUTPUT_DIR="$UNIVERSAL_DIR/output"
TMP_DIR="tmp_universal"

# Create only relevant dirs
rm -rf "$TMP_DIR"
mkdir -p "$OUTPUT_DIR"

# Loop through all device zips
for zipfile in "$SOURCE_DIR"/*.zip; do
    filename=$(basename "$zipfile")
    model=$(echo "$filename" | grep -oP '_\K[a-z0-9]+(?=_UNOFFICIAL)')

    echo "Processing: $filename (Model: $model)"

    # Create temp extraction directory
    mkdir -p "$TMP_DIR/$model"
    unzip -qq "$zipfile" -d "$TMP_DIR/$model"

    # Rename images if they exist
    [ -f "$TMP_DIR/$model/files/boot.img" ] && mv "$TMP_DIR/$model/files/boot.img" "$TMP_DIR/$model/files/boot${model}.img"
    [ -f "$TMP_DIR/$model/files/dtbo.img" ] && mv "$TMP_DIR/$model/files/dtbo.img" "$TMP_DIR/$model/files/dtbo${model}.img"

    # Build universal zip layout
    mkdir -p "$TMP_DIR/$model_pack/META-INF/com/google/android"
    mkdir -p "$TMP_DIR/$model_pack/files"

    # Copy TWRP flash files
    cp "$UNIVERSAL_DIR/update-binary" "$TMP_DIR/$model_pack/META-INF/com/google/android/"
    cp "$UNIVERSAL_DIR/updater-script" "$TMP_DIR/$model_pack/META-INF/com/google/android/"

    # Copy renamed .img files
    cp "$TMP_DIR/$model/files/"*"$model".img "$TMP_DIR/$model_pack/files/"

    # Build final TWRP-flashable zip
    pushd "$TMP_DIR/$model_pack" > /dev/null
    zip -r -qq "$OUTPUT_DIR/universal_${model}.zip" .
    popd > /dev/null
done

# Clean up temp dir
rm -rf "$TMP_DIR"

echo "-----------------------------------------------------"
echo " Universal TWRP zips created in $OUTPUT_DIR"
echo "-----------------------------------------------------"

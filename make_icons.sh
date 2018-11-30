#!/bin/sh
if [[ `uname -s` = Darwin ]]; then
    mkdir build
    rm -r build/fuse3ds.iconset
    mkdir build/fuse3ds.iconset

    cp fuse3ds/data/16x16.png build/fuse3ds.iconset/icon_16x16.png
    cp fuse3ds/data/32x32.png build/fuse3ds.iconset/icon_16x16@2x.png
    cp fuse3ds/data/32x32.png build/fuse3ds.iconset/icon_32x32.png
    cp fuse3ds/data/64x64.png build/fuse3ds.iconset/icon_32x32@2x.png
    cp fuse3ds/data/128x128.png build/fuse3ds.iconset/icon_128x128.png
    cp fuse3ds/data/1024x1024.png build/fuse3ds.iconset/icon_512x512@2x.png

    convert fuse3ds/data/1024x1024.png -resize 256x256 build/256x256_gen.png
    convert fuse3ds/data/1024x1024.png -resize 512x512 build/512x512_gen.png
    cp build/256x256_gen.png build/fuse3ds.iconset/icon_128x128@2x.png
    cp build/256x256_gen.png build/fuse3ds.iconset/icon_256x256.png
    cp build/512x512_gen.png build/fuse3ds.iconset/icon_256x256@2x.png
    cp build/512x512_gen.png build/fuse3ds.iconset/icon_512x512.png

    iconutil --convert icns --output build/AppIcon.icns build/fuse3ds.iconset
fi

cd fuse3ds/data
convert 1024x1024.png 128x128.png 64x64.png 32x32.png 16x16.png \
          \( -clone 2 -resize 48x48 \) \
          \( -clone 0 -resize 256x256 \) \
          -delete 0 windows.ico

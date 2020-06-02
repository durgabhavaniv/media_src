```
export HOME=/home/test
export http_proxy=http://192.168.100.100:3128
export https_proxy=http://192.168.100.100:3128
```

# To setup downloaded source code and to build & install environment
```
export ROOT_INSTALL_DIR=/opt/media
mkdir -p $ROOT_INSTALL_DIR
export SRC_DIR=$HOME/media_src
mkdir -p $SRC_DIR
```
```
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$ROOT_INSTALL_DIR/lib/pkgconfig/:$ROOT_INSTALL_DIR/lib64/pkgconfig/:/usr/local/lib/pkgconfig
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROOT_INSTALL_DIR/lib:$ROOT_INSTALL_DIR/lib64:/usr/local/lib/
export LDFLAGS="-L$ROOT_INSTALL_DIR/lib -L$ROOT_INSTALL_DIR/lib64"
export LIBVA_DRIVER_NAME=iHD
export LIBVA_DRIVERS_PATH=$ROOT_INSTALL_DIR/lib/dri
```
```
yum update --exclude=kernel*
```
# To install basic dependencies
```
yum install -y gcc
yum install -y gcc-c++
yum install -y autoconf
yum install -y automake
yum install -y m4
yum install -y libpciaccess-devel
yum install -y epel-release
yum install -y cmake3 //
yum install -y pciutils
yum install -y bison
yum install -y flex
yum install -y elfutils-libelf-devel
yum install -y bc
yum install -y openssl-devel
yum install -y python
yum install -y xorg-x11-server-devel
yum install -y libXfont2-devel
yum install -y expat-devel
yum install -y libXrandr-devel
yum install -y nasm
yum install -y git
yum install -y libtool
yum install -y make
yum install -y yasm-1.2.0 //
yum install -y which
yum install -y wget
yum install -y sudo
yum install -y zip
yum install -y unzip
yum install -y zlib-devel
```
# To link cmake and install SDL
```
ln -s /usr/bin/cmake3 /usr/bin/cmake
yum install -y SDL2 SDL2-devel
```
# Install x264
```
cd $SRC_DIR
git clone https://code.videolan.org/videolan/x264.git
cd x264
git checkout aaa9aa83a111ed6f1db253d5afa91c5fc844583f	
./configure --enable-shared --prefix=$ROOT_INSTALL_DIR --enable-pic --disable-opencl
make 
sudo make install
```
# LibDRM
```
cd $SRC_DIR
git clone https://gitlab.freedesktop.org/mesa/drm.git $SRC_DIR/drm
cd $SRC_DIR/drm
git checkout 14922551aa33e7592d2421cc89cf20a860a65310
# ./autogen.sh --prefix=/usr --libdir=/usr/lib64 --enable-shared
./autogen.sh --prefix=$ROOT_INSTALL_DIR --enable-shared
make 
sudo make install
```
# 2D Driver(xf86-video-intel)
```
cd $SRC_DIR
git clone https://gitlab.freedesktop.org/xorg/driver/xf86-video-intel.git
cd $SRC_DIR/xf86-video-intel
./autogen.sh --prefix=$ROOT_INSTALL_DIR --enable-shared
make
sudo make install
```
# GMMLib
```
cd $SRC_DIR
git clone https://github.com/intel/gmmlib $SRC_DIR/gmmlib
cd $SRC_DIR/gmmlib
mkdir build
cd build
cmake $SRC_DIR/gmmlib -DCMAKE_INSTALL_PREFIX=$ROOT_INSTALL_DIR
make
sudo make install
```
# VAAPI and Video Driver
# VAAPI/LibVA
```
cd $SRC_DIR
git clone https://github.com/intel/libva $SRC_DIR/libva
cd $SRC_DIR/libva
git fetch --tags
git checkout tags/2.4.1
./autogen.sh --prefix=$ROOT_INSTALL_DIR --enable-shared
sed -i 's/for (int i = 0;/int i = 0;for (i = 0;/g' ./va/va_trace.c
make 
sudo make install
```
# Libva-Utils
```
cd $SRC_DIR
git clone https://github.com/intel/libva-utils $SRC_DIR/libva-utils
cd $SRC_DIR/libva-utils
git fetch --tags
git checkout tags/2.4.1
./autogen.sh --prefix=$ROOT_INSTALL_DIR --enable-tests --enable-shared
make
sudo make install
```
# Video Driver (Recommend to use the Intel iHD video driver)
```
cd $SRC_DIR
git clone https://github.com/intel/media-driver $SRC_DIR/media-driver
cd $SRC_DIR/media-driver
git fetch --tags
git checkout tags/intel-media-18.4.1
mkdir build
cd build
cmake $SRC_DIR/media-driver -DCMAKE_INSTALL_PREFIX=$ROOT_INSTALL_DIR -DBYPASS_MEDIA_ULT=yes
make 
sudo make install
```
# Intel MediaSDK: using for all ffmpeg-qsv/gst-msdk(under gst-pugin-bad) media relative path
```
cd $SRC_DIR
git clone https://github.com/Intel-Media-SDK/MediaSDK $SRC_DIR/MediaSDK
cd $SRC_DIR/MediaSDK
git fetch --tags
git checkout tags/intel-mediasdk-19.2.0
mkdir build
cd build
cmake $SRC_DIR/MediaSDK -DCMAKE_INSTALL_PREFIX=$ROOT_INSTALL_DIR
make
sudo make install
```
# To install FFmpeg
```
cd $SRC_DIR
git clone https://git.ffmpeg.org/ffmpeg.git $SRC_DIR/ffmpeg
cd $SRC_DIR/ffmpeg
git fetch --tags
git checkout tags/n4.1
export TMPDIR=~/tmp-ffmpeg
mkdir $TMPDIR
./configure --prefix=$ROOT_INSTALL_DIR --enable-shared --enable-vaapi --enable-libmfx --enable-gpl --enable-libx264 --enable-gpl --enable-nonfree
make
sudo make install
rm -rf $TMPDIR
unset TMPDIR
```

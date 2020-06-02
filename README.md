# media_src

# TEST RUN FFMPEG WITH QSV

```
export HOME=/home/sas
export ROOT_INSTALL_DIR=/opt/media
export SRC_DIR=$HOME/media_src
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$ROOT_INSTALL_DIR/lib/pkgconfig/:$ROOT_INSTALL_DIR/lib64/pkgconfig/:/usr/local/lib/pkgconfig
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROOT_INSTALL_DIR/lib:$ROOT_INSTALL_DIR/lib64:/usr/local/lib/
export LDFLAGS="-L$ROOT_INSTALL_DIR/lib -L$ROOT_INSTALL_DIR/lib64"
export LIBVA_DRIVER_NAME=iHD
export LIBVA_DRIVERS_PATH=$ROOT_INSTALL_DIR/lib/dri
export PATH=/opt/media/share/mfx/samples/:/opt/media/bin:$PATH
export CPPFLAGS="-I/opt/media/include $CPPFLAGS"
export CFLAGS="-I/opt/media/include $CFLAGS"
export CXXFLAGS="-I/opt/media/include $CXXFLAGS"
which ffmpeg


ffmpeg -v verbose -hwaccel qsv -c:v h264_qsv -i ./video1_min.mp4 -c:v h264_qsv -b:v 1M -maxrate 1M -c:a copy -y trans_qsv_cbr.mp4
```

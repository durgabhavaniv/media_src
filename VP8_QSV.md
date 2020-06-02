
# INSTALLATION PROCEDURE-CENTOS


 FFMpeg installation requires yum package manager (default for centos).

  1. Check if java is already installed or not. If not, install openjdk version 1.8.0_162 or above in the system. 

  2. Create the following folders ffmpeg_sources, ffmpeg_build, bin in $HOME(Home directory) and switch to the folder ffmpeg_sources. 

   ffmpeg_sources - Folder where we fetch and download all the source packages and compile them. 

  we fetch all the source dependencies into separate folders inside this folder.
 
   ffmpeg_build - Folder where all the packages(libraries, header files, shared libraries) will be installed.
 

  bin - Folder where all the binaries of the installation process go.

  3. Install dependencies (no need of git and mercurial as we can pass the tarballs directly using scp). This installation alone will need 'root' user permission. 

 Rest of the installation doesn't need 'root' access.
   yum install autoconf automake bzip2 cmake freetype-devel libtool make pkgconfig zlib-devel gcc gcc-c++

  4. install nasm assembler. Fetch nasm-2.13.03 assembler source tarball, untar it and go to respective folder.
   ./autogen.sh
   ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin"
   make
   make install

  5. install yasm assembler. Fetch yasm-1.3.0 assembler source tarball, untar it and go to respective folder.
   export ACCEPT_INFERIOR_RM_PROGRAM=yes (for yasm only)
   ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin"
   make
   make install

  6. install libopus - by default shared libraries will be created. Fetch libopus-1.2.1 source tarball, untar it and go to respective folder.
   ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin"
   make 
   make install

  7. install libvpx. Fetch libvpx-1.7.0 source tarball, untar it and go to respective folder.
   ./configure --prefix="$HOME/ffmpeg_build" --enable-vp8 --enable-shared --enable-webm-io --enable-libyuv --as=yasm --enable-vp9-highbitdepth
   make
   make install

  8. Install x264. Fetch x264 source tarball and untar it and go to respective folder.
   ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --enable-shared --enable-pic --disable-opencl
   make
  make install 

  9. Install libfdk-aac. Fetch libfdk-aac source tarball, untar it and go to the respective folder.
   autoreconf -fiv 
   ./configure --prefix="$HOME/ffmpeg_build" --enable-shared
   make
   make install
    

  10. set TMPDIR environment variable to some other directory, as ffmpeg's ./configure will try to make some changes inside that directory
   export TMPDIR=~/tmp-ffmpeg
   mkdir $TMPDIR

  11. install ffmpeg. Fetch FFMpeg-3.4.2 source tarball, untar it and go to respective folder.(use --enable-gpl for h264 because it is under gpl and use 

  --enable-nonfree for libfdk_aac because it comes under franhoffer )

   PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build"  

  --extra-cflags="-I$HOME/ffmpeg_build/include" --extra-ldflags="-L$HOME/ffmpeg_build/lib" --bindir="$HOME/bin" --enable-gpl --enable-libx264  --enable-libopus 

  --enable-libvpx --enable-shared --disable-stripping --enable-nonfree --enable-libfdk-aac     

  make 

  make install

  hash -r

  12. remove ffmpeg-tmpdir
   rm -rf $TMPDIR
   unset TMPDIR

  13. If FFMpeg is not able to detect certain dependant shared libraries, then edit the following file on the system,

   /etc/ld.so.conf 

     Add '/usr/local/lib' entry into the file.

  After that, run 'ldconfig' command.
  Now, FFMpeg should be able to detect the shared libarries.

   ldconfig creates the necessary links and cache to the most recent shared libraries found in the directories specified on the command line, 

   in the file   /etc/ld.so.conf, and in the trusted directories (    /lib and /usr/lib). Some libarries do not allow themselve to be detected directly. 

   So this has to be done.



  FFMPEG DEPENDENCIES:

  1. NASM assembler - nasm-2.13.03.    https://www.nasm.us/pub/nasm/releasebuilds/2.13.03/nasm-2.13.03.tar.gz

  2. YASM assembler - yasm-1.3.0.      http://www.tortall.net/projects/yasm/releases/

  3. libvpx - libvpx-1.7.0.   https://github.com/webmproject/libvpx/archive/v1.7.0.tar.gz

  4. libopus - opus-1.2.1.   https://archive.mozilla.org/pub/opus/opus-1.2.1.tar.gz
 
  5. FFMpeg - ffmpeg-4.2.1.   https://ffmpeg.org/releases/ffmpeg-4.2.1.tar.bz2

  6. fdk_aac - 0.1.6 https://github.com/mstorsjo/fdk-aac

  7.x264 -  0.157.x  http://download.videolan.org/pub/videolan/x264/snapshots/x264-snapshot-20190226-2245-stable.tar.bz2 

  NOTE:
  All are OpenSource Libraries. The tarball versions of the above mentioned latest stable releases can be found online.

 The above 13th point may not be neccessary but it is advised to follow it.

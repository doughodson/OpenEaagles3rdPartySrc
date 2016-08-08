#!/bin/bash

# initialize the location to install libraries
init_install_location()
{
  # location of install libs
  rm -rf $OE_3RD_PARTY_ROOT
  mkdir $OE_3RD_PARTY_ROOT
  # temporary location to build libs
  rm -rf tmp
  mkdir tmp
}

# ftgl
install_ftgl()
{
  tar xzvf ftgl-2.1.3-rc5.tar.gz --directory tmp
  cd tmp/ftgl-2.1.3~rc5
  ./configure --prefix=$OE_3RD_PARTY_ROOT --disable-shared
  make
  make install
  cd ../..
}

# freetype
install_freetype()
{
  tar xzvf freetype-2.6.tar.gz --directory tmp
  cd tmp/freetype-2.6
  ./configure --prefix=$OE_3RD_PARTY_ROOT --disable-shared
  make
  make install
  cd ../..
}

# freeglut
install_freeglut()
{
  tar xzvf freeglut-2.8.1.tar.gz --directory tmp
  cd tmp/freetype-2.8.1
  ./configure --prefix=$OE_3RD_PARTY_ROOT --disable-shared
  make
  make install
  cd ../..
}

# cigi
install_cigi()
{
  tar xzvf ccl_3_3_3a.tar.gz --directory tmp
  cd tmp/ccl
  ./configure --prefix=$OE_3RD_PARTY_ROOT --disable-shared
  make
  make install
  cd ../..
}

# jsbsim
install_jsbsim()
{
  tar xzvf jsbsim_cvs_v2015_0704.tgz --directory tmp
  cd tmp/jsbsim
  ./autogen.sh --prefix=$OE_3RD_PARTY_ROOT --enable-libraries
  make
  make install
  cd ../..
}

# protobuf
install_protobuf()
{
  tar xzvf protobuf-2.6.1.tar.gz --directory tmp
  cd tmp/protobuf-2.6.1
  ./configure --prefix=$OE_3RD_PARTY_ROOT --disable-shared
  make
  make install
  cd ../..
}

# zeromq
install_zeromq()
{
  tar xzvf zeromq/zeromq-4.0.3.tar.gz --directory tmp
  cd tmp/zeromq-4.0.3
  ./configure --prefix=$OE_3RD_PARTY_ROOT
  make
  make install
  cd ../..
  cp zeromq/zmq.hpp $OE_3RD_PARTY_ROOT/include
}

# FOX GUI
install_fox_v1_7()
{
  tar xzvf fox-1.7.56.tar.gz --directory tmp
  cd tmp/fox-1.7.56
  ./configure --prefix=$OE_3RD_PARTY_ROOT
  make
  make install
  cd ../..
}

# FLTK GUI
install_fltk_v1_3()
{
  tar xzvf fltk-1.3.3-source.tar.gz --directory tmp
  cd tmp/fltk-1.3.3
  ./configure --prefix=$OE_3RD_PARTY_ROOT
  make
  make install
  cd ../..
}

# wxWidgets
install_wxWidgets()
{
  bzip2 --keep --decompress wxWidgets-3.1.0.tar.bz2
  tar xvf wxWidgets-3.1.0.tar --directory tmp
  cd tmp/wxWidgets-3.1.0
  ./configure --prefix=$OE_3RD_PARTY_ROOT --disable-shared
  make
  make install
  cd ../..
}

# check for location to install 3rd party libs
if [ -z "$OE_3RD_PARTY_ROOT" ]; then
   echo "Need to source setenv from within OpenEaagles"
   exit 1
fi

init_install_location
#install_ftgl
#install_freetype
#install_freeglut
install_cigi
install_jsbsim
install_protobuf
install_zeromq
install_fox_v1_7
install_fltk_v1_3
#install_wxWidgets


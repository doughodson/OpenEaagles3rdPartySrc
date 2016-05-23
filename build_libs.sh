#!/bin/bash

# initialize the location to install libraries
init_install_location()
{
  rm -rf $OE_3RD_PARTY_ROOT
  mkdir $OE_3RD_PARTY_ROOT
}

# cigi
install_cigi()
{
  rm -rf ccl
  tar xzvf ccl_3_3_3a.tar.gz
  cd ccl
  ./configure --prefix=$OE_3RD_PARTY_ROOT --disable-shared
  make
  make install
  cd ..
}

# jsbsim
install_jsbsim()
{
  rm -rf jsbsim
  tar xzvf jsbsim_cvs_v2015_0704.tgz
  cd jsbsim
  ./autogen.sh --prefix=$OE_3RD_PARTY_ROOT --enable-libraries
  make
  make install
  cd ..
}

# protobuf
install_protobuf()
{
  rm -rf protobuf-2.6.1
  tar xzvf protobuf-2.6.1.tar.gz
  cd protobuf-2.6.1
  ./configure --prefix=$OE_3RD_PARTY_ROOT --disable-shared
  make
  make install
  cd ..
}

# zeromq
install_zeromq()
{
  cd zeromq
  rm -rf zeromq-4.0.3
  tar xzvf zeromq-4.0.3.tar.gz
  cd zeromq-4.0.3
  ./configure --prefix=$OE_3RD_PARTY_ROOT
  make
  make install
  cd ..
  cp zmq.hpp $OE_3RD_PARTY_ROOT/include
  cd ..
}

# FOX GUI
install_fox_v1_6()
{
  rm -rf fox-1.6.50
  unzip fox-1.6.50.zip
  cd fox-1.6.50
  ./configure --prefix=$OE_3RD_PARTY_ROOT
  make
  make install
  cd ..
}

# FOX GUI
install_fox_v1_7()
{
  rm -rf fox-1.7.55
  tar xzvf fox-1.7.55.tar.gz
  cd fox-1.7.55
  ./configure --prefix=$OE_3RD_PARTY_ROOT
  make
  make install
  cd ..
}

# FLTK GUI
install_fltk()
{
  rm -rf fltk-1.3.3
  tar xzvf fltk-1.3.3-source.tar.gz
  cd fltk-1.3.3
  ./configure --prefix=$OE_3RD_PARTY_ROOT
  make
  make install
  cd ..
}

# wxWidgets
install_wxWidgets()
{
  rm -rf wxWidgets-3.1.0
  bzip2 --keep --decompress wxWidgets-3.1.0.tar.bz2
  tar xvf wxWidgets-3.1.0.tar
  cd wxWidgets-3.1.0
  ./configure --prefix=$OE_3RD_PARTY_ROOT --disable-shared
  make
  make install
  cd ..
}

# check for location to install 3rd party libs
if [ -z "$OE_3RD_PARTY_ROOT" ]; then
   echo "Need to source setenv from within OpenEaagles"
   exit 1
fi

init_install_location
install_cigi
install_jsbsim
install_protobuf
install_zeromq
install_fox_v1_6
install_fox_v1_7
install_fltk
#install_wxWidgets

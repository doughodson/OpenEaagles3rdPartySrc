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

# ftgl (depends upon freetype)
install_ftgl()
{
  pushd .
  tar xzvf ftgl-2.1.3-rc5.tar.gz --directory tmp
  cd tmp/ftgl-2.1.3~rc5
  ./configure --prefix=$OE_3RD_PARTY_ROOT --disable-shared
  make
  make install
  popd
}

# cigi
install_cigi()
{
  pushd .
  tar xzvf ccl_3_3_3a.tar.gz --directory tmp
  cd tmp/ccl
  ./configure --prefix=$OE_3RD_PARTY_ROOT --disable-shared
  make
  make install
  popd
}

# jsbsim
install_jsbsim()
{
  pushd .
  tar xzvf jsbsim_cvs_v2015_0704.tgz --directory tmp
  cd tmp/jsbsim
  ./autogen.sh --prefix=$OE_3RD_PARTY_ROOT --enable-libraries
  make
  make install
  popd
}

# protobuf
install_protobuf()
{
  pushd .
  tar xzvf protobuf-2.6.1.tar.gz --directory tmp
  cd tmp/protobuf-2.6.1
  ./configure --prefix=$OE_3RD_PARTY_ROOT --disable-shared
  make
  make install
  popd
}

# zeromq
install_zeromq()
{
  pushd .
  tar xzvf zeromq/zeromq-4.0.3.tar.gz --directory tmp
  cd tmp/zeromq-4.0.3
  ./configure --prefix=$OE_3RD_PARTY_ROOT
  make
  make install
  popd
  cp zeromq/zmq.hpp $OE_3RD_PARTY_ROOT/include
}

# check for location to install 3rd party libs
if [ -z "$OE_3RD_PARTY_ROOT" ]; then
   echo "Need to source setenv from within OpenEaagles"
   exit 1
fi

init_install_location
install_ftgl
install_cigi
install_jsbsim
install_protobuf
install_zeromq

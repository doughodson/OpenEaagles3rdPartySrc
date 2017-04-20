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
   echo 'FTGL being compiled...' >&2
   pushd .
   tar xzvf ftgl-2.1.3-rc5.tar.gz --directory tmp
   cd tmp/ftgl-2.1.3~rc5
   ./configure --prefix=$OE_3RD_PARTY_ROOT --disable-shared
   make
   make install
   popd
}

# freeglut
# requires XInput.h (libxi-dev to be installed)
install_freeglut()
{
   # check for cmake, needed to compile freeglut lib
   if [ -x "$(command -v cmake)" ]; then
      echo 'cmake found, FreeGlut being compiled...' >&2
      pushd .
      tar -xvf freeglut-3.0.0.tar.gz --directory tmp
      mkdir tmp/freeglut-build
      cd tmp/freeglut-build
      cmake -DCMAKE_INSTALL_PREFIX=$OE_3RD_PARTY_ROOT \
            ../freeglut-3.0.0
      make
      make install
      popd
   else
      echo 'cmake NOT found, FreeGlut not compiled!' >&2
   fi
}

# cigi
install_cigi()
{
   echo 'CIGI being compiled...' >&2
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
   echo 'JSBSim being compiled...' >&2
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
   echo 'Google Protobuf being compiled...' >&2
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
   echo 'ZeroMQ being compiled...' >&2
   pushd .
   tar xzvf zeromq/zeromq-4.2.1.tar.gz --directory tmp
   cd tmp/zeromq-4.2.1
   ./configure --prefix=$OE_3RD_PARTY_ROOT
   make
   make install
   popd
   cp zeromq/zmq.hpp $OE_3RD_PARTY_ROOT/include
}

# OpenRTI
install_hla()
{
   # check for cmake, needed to compile HLA libs
   if [ -x "$(command -v cmake)" ]; then
      echo 'cmake found, OpenRTI (HLA) being compiled...' >&2
      pushd .
      tar -jxvf OpenRTI-0.8.0.tar.bz2 --directory tmp
      mkdir tmp/openrti-build
      cd tmp/openrti-build
      cmake -DCMAKE_INSTALL_PREFIX=$OE_3RD_PARTY_ROOT \
            -DOPENRTI_ENABLE_PYTHON_BINDINGS:BOOL=OFF \
            -DOPENRTI_BUILD_SHARED:BOOL=OFF \
            ../OpenRTI-0.8.0
      make
      make install
      popd
   else
      echo 'cmake NOT found, OpenRTI (HLA) not compiled!' >&2
   fi
}

# flex
install_flex()
{
   echo 'flex being compiled...' >&2
   pushd .
   tar xzvf parser-utils/flex-2.5.39.tar.gz --directory tmp
   cd tmp/flex-2.5.39
   ./configure --prefix=$OE_3RD_PARTY_ROOT --disable-shared
   make
   make install
   popd
}

# bison
install_bison()
{
   echo 'bison being compiled...' >&2
   pushd .
   tar xzvf parser-utils/bison-3.0.4.tar.gz --directory tmp
   cd tmp/bison-3.0.4
   ./configure --prefix=$OE_3RD_PARTY_ROOT --disable-shared
   make
   make install
   popd
}

# check for location to install 3rd party libs
if [ -z "$OE_3RD_PARTY_ROOT" ]; then
   echo "Need to source setenv from within OpenEaagles"
   exit 1
fi

init_install_location
#install_freeglut
install_ftgl
install_cigi
install_jsbsim
install_protobuf
install_zeromq
install_hla
#install_flex
#install_bison

export PATH=$OE_3RD_PARTY_ROOT/bin:$PATH


#!/bin/bash

# initialize the location to install flex and bison
init_install_location()
{
   # location of install libs
   rm -rf $OE_3RD_PARTY_ROOT
   mkdir $OE_3RD_PARTY_ROOT
   # temporary location to build libs
   rm -rf tmp
   mkdir tmp
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
install_flex
install_bison

export PATH=$OE_3RD_PARTY_ROOT/bin:$PATH



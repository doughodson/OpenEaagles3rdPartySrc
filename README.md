
OpenEaagles 3rd Party Source
============================

The most current version of OpenEaagles (OE) can be found at [www.OpenEaagles.org][1].

* This package includes the source code for OE's 3rd party dependency libraries.

* We recommend compiling and installing these libraries in your own location within your user account.  This avoids any potential clashes with system installed files, especially if you intend to use Clang. The script file `build_libs.sh` will build and install all required libraries to your local library path. Make sure to set your environment variables via `source setenv` in `OpenEaagles` directory.  (Much of what follows in this README is how to do this manually.)

* If you plan to use Clang to compile code, make sure to compile the provided libraries with that compiler and install them into your own account at a specific location.  Google Protocol Buffers in particular, has a problem if compiled with Clang and installed in `/usr/local/lib` (especially if other copies of it exist in your system).  The Clang-compiled version of this library does not play nice with other GCC-compiled versions that might be installed in other places. Doing so might result in a non-working Linux system!

* To use Clang as your default compiler for all projects, consider adding `export CC=clang` and `export CXX=clang++` to your .bashrc (or equivalent) file.

* Using `configure` individual libraries to be compiled can be targeted to install to a particular location (i.e., other than `/usr/local`). Use the `--prefix=<path>` argument.

As an example, consider the following directory structure:

`/home/me` # location of my user account  
`/home/me/oe` # the place where all OE related work is located  
`/home/me/oe/OpenEaagles` # OE framework  
`/home/me/oe/OpenEaaglesExamples` # OE examples  
`/home/me/oe/oe_3rdparty` # desired location of where 3rd party dependencies will be installed  
`/home/me/oe/OpenEaagles3rdPartySrc` # source code to 3rd party packages  

After unzipping or untarring ccl, jsbsim, zeromq, protobuf, enter each directory and run `configure` as follow:

`./configure --prefix=/home/me/oe/oe_3rdparty` # for ccl, protobuf and zeromq  
`./autogen.sh --prefix=home/me/oe/oe_3rdparty --enable-libraries` # for JSBSim and tell it to build a library  

For each library run `configure` (or `autogen.sh` for JSBSim) to setup build environment; then `make` to compile and create libraries; and finally `make install` to copy/install files to location specified.  The example will compile all libraries and install them to `/home/me/oe/oe_3rdparty`.  For the zeromq library; copy the file `zmq.hpp` to `oe_3rdparty/include`.

* Several dependencies can be installed via `apt-get` or `yum` if Internet access is available. Other libraries, such as cigi and JSBSim are not available in the public repositories.

* For the libraries being manually compiled and installed, make sure to use included in this package.  For example, the version of JSBSim included is the one OE is designed to work with.  We do our best to ensure compatibility with a wide range of versions associated with dependencies.


[1]: http://www.OpenEaagles.org

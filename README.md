
OpenEaagles 3rd Party Source
============================

The most current version of OpenEaagles (OE) can be found at [www.OpenEaagles.org][1].

* This package includes the source code for OE's 3rd party dependency libraries.

* We recommend compiling and installing these libraries into a directory within your user account.  This avoids any potential clashes with installed system files. The script file `build_libs.sh` will build and install almost all required libraries to your local directory. Make sure to set environment variables by running `source setenv` within the `OpenEaagles` directory.

* Make sure to have `autogen`, `automake`, `libtool`, and `libtool-bin` installed.  These are essential prerequisites for `configure` and/or `autogen` scripts to execute properly.

* If using the `wxWidgets` library, make sure GTK+ 3.0 is installed. For a Ubuntu-based system, use `apt-get install libgit-3-dev`.

* If you plan to use the Qt library, download and install the complete Qt package; we make no attempt at bundling Qt as a 3rd party library; it's very large as it includes a complete set of support tools for development.

* If you are going to use the Clang compiler, make sure to compile the provided libraries with that compiler and install them into a directory within your account; this keeps them away from any system directories. Google Protocol Buffers in particular, has a problem if compiled with Clang and installed in `/usr/local/lib` (especially if other copies of it exist in your system).  The Clang-compiled version of this library does not play nice with other GCC-compiled versions that might be installed in other places. Doing so might result in a non-working Linux system!  Keep things clean and simple, keep libraries local.

* If you would like to use Clang as the default compiler for all projects, consider adding `export CC=clang` and `export CXX=clang++` to your .bashrc (or equivalent) file.  All the build tools are smart enough to use the compiler specified by `CC` and `CXX`.

* * *

The following is more explicit step-by-step instructions to build individual libraries.

* Using `configure`, individual libraries can be targeted for installation to a particular directory using the command line argument `--prefix=<path>`.  If this is not specified, the typical default path is `/usr/local`.

As an example, consider the following directory structure:

`/home/me` # location of my user account  
`/home/me/oe` # the place where all OE related work is located  
`/home/me/oe/OpenEaagles` # OE framework  
`/home/me/oe/OpenEaaglesExamples` # OE examples  
`/home/me/oe/oe_3rdparty` # desired location of where 3rd party dependencies will be installed  
`/home/me/oe/OpenEaagles3rdPartySrc` # source code to 3rd party packages  

After unzipping or untarring ccl, jsbsim, zeromq, protobuf, etc, enter each directory and run `configure` as follows to setup the build system:

`./configure --prefix=/home/me/oe/oe_3rdparty` # for most libraries  
`./autogen.sh --prefix=home/me/oe/oe_3rdparty --enable-libraries` # for JSBSim  

Next, use `make` to compile and create libraries, followed by `make install` to copy or install them to the directory specified.  The example will compile all libraries and install them to `/home/me/oe/oe_3rdparty`.  For zeromq, manually copy the file `zmq.hpp` to `oe_3rdparty/include`.

* Several dependencies can be installed via `apt-get` or `yum` (e.g., FTGL, FreeType and FreeGlut) if Internet access is available. Other libraries, such as cigi and JSBSim are not available in the public repositories, hence the need this package.

* For the libraries being manually compiled and installed, make sure to use the ones provided here.  As an example, the version of JSBSim included here, defines an API that OE is designed to use.  We do our best to ensure compatibility with a wide range of versions but not everything is 100% all the time; to be safe, use the ones provided.


[1]: http://www.OpenEaagles.org

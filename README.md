
OpenEaagles 3rd Party Source
============================

The most current version of OpenEaagles can be found at [www.OpenEaagles.org][1].

* This package includes the source files for OE 3rd party dependencies.

* We recommend compiling and installing these libraries in your own private library.  This avoids any clashes with system installed files, especially if you intend to use Clang.

* If you plan to use Clang to compile files, make sure to compile the provided libraries with that compiler and install them into your own local library.  Google Protocol Buffers in particular, has a problem if compiled with Clang and installed in `/usr/local/lib`.  The Clang-compiled version of this library does not play nice with other GCC-compiled versions that might be installed in other places. Doing so might result in a non-working Linux system!

* To compile code (by default) with Clang, consider adding `export CC=clang` and `export CXX=clang++` to your .bashrc file.

* Individual libraries can be compiled and targeted for installation to a particular location (i.e., other than `/usr/local`) by using the `--prefix=<path>` argument with configure.

Example - consider the following directory structure:

`/home/me`        # location of my user account  
`/home/me/oe`    # the place where framework, examples and my projects are located  
`/home/me/oe/OpenEaagles`     # OE framework  
`/home/me/oe/OpenEaaglesExamples`  # OE examples  
`/home/me/oe/oe_3rdparty`         # desired location of where 3rd party dependencies will be installed  
`/home/me/oe/OpenEaagles3rdPartySrc` # source code to 3rd party packages  

After unzipping or untarring ccl, jsbsim, zeromq, protobuf, enter each directory and configure as follow:

`./configure --prefix=/home/me/oe/oe_3rdparty` # for ccl, protobuf and zeromq  
`./autogen.sh --prefix=home/me/oe/oe_3rdparty` # for JSBSim and tell it to build a library  

For each library run `configure` (oe `autogen.sh` for JSBSim) to setup build environment, then `make` to compile and create libraries, followed by `make install` to copy files to location specified.  This should compile all libraries and install them into the `oe_3rdparty` path.  For the zeromq library, copy the file `zmq.hpp` to `oe_3rdparty/include`.

* Several dependencies can be install via `apt-get` or `yum` if Internet access is available. Other libraries, such as Cigi and JSBSim are not available in the repositories.

* Make sure to use the version of JSBSim included in this archive when installing on a Linux-based computer.


[1]: http://www.OpenEaagles.org

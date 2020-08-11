mkdir build
cd build

cmake -G "NMake Makefiles" ^
	  -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
	  -DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=ON ^
	  -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
	  -DCMAKE_BUILD_TYPE=Release ^
	  -DCMAKE_INSTALL_LIBDIR=lib ^
	  -DSQLITECPP_INTERNAL_SQLITE=OFF ^
	  -DBUILD_SHARED_LIBS=ON ^
      %SRC_DIR%
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1

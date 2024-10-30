build_type := DEBUG
build_tool := Ninja
# build_tool := Unix Makefiles

.PHONY: all cmake clangd build run clean

all: cmake build

cmake:
	cmake -S . -B build -G $(build_tool) -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=$(build_type)

build:
	cmake --build build -j8

clean:
	/bin/rm -rf build/ bin/ .cache/ data/
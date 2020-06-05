#!/usr/bin/env bash

# Check is Linux environment.
if [ `uname -s` != "Linux" ]; then
    echo "** ERROR ** This script can be run only on a Linux environment!"
    exit 1
fi

# Check Linux distribution is supported.
if [ ! -f "/etc/debian_version" ]; then
    echo "** ERROR ** Your distribution is not supported for this script!"
    echo ""
    echo "Please ensure you have the following packages:"
    echo "  - Essential development packages for your platform (C headers, etc.)"
    echo "  - Development headers for mpfr, libmpc, and gmp"
    echo "  - gcc >= v8"
    echo "  - Make"
    echo "  - Qemu"
    echo ""
    echo "> Then run this script (Toolchain/build.sh) again with the -force flag."
    exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

VERSION="0.0.01-d01-dev"

MAKE="make"

print_toolchain_info () {
    echo "Toolchain, version $VERSION (i386-pc-qlipha)"
}

# Print help (show all args).
help () {
    print_toolchain_info
    echo "List of available arguments:"
    echo ""
    echo -e "\e[1mBUILD \e[0m"
    echo -e "\tbuild-iso \e[37m- Generate the ISO. \e[0m"
    echo ""
    echo -e "\e[1mOTHER \e[0m"
    echo -e "\tclean \e[37m- Clean the project (.o|.d|.elf|.iso). \e[0m"
}

# Clean project.
clean () {
    pushd "$DIR/../"
        echo "Cleaning up.."
        $MAKE clean
    popd
}

# Build ISO.
build_iso () {
    if [ ! -d build ]; then
        mkdir build
    fi

    pushd "$DIR/../Kernel/"
        echo "Build Kernel.."
        $MAKE
        grub-file --is-x86-multiboot kernel.elf
    popd

    pushd "$DIR/../"
        if [ ! -f "Kernel/kernel.elf" ]; then
            echo "** ERROR ** 'kernel.elf' not found!"
            exit 1
        fi

        echo "Setup ISO build.."
        mkdir -p Toolchain/build/boot/grub
        cp Kernel/kernel.elf Toolchain/build/boot/kernel.elf
        cp -avr Toolchain/iso/grub/ Toolchain/build/boot/
    popd

    pushd "$DIR"
        echo "Generate ISO.."
        grub-mkrescue -o Qlipha.iso build/
        rm -rf build/
        chown $SUDO_USER:$SUDO_USER Qlipha.iso
    popd

    echo -e "\e[92mBuild ISO with successfully! \e[0m"
}

if [ ! -z "$1" ]; then
    if [ "$1" == "help" ]; then
        help
    elif [ "$1" == "clean" ]; then
        clean
    elif [ "$1" == "build-iso" ]; then
        build_iso
    else
        echo -e "\e[91mThis argument is not recognized! \e[0m"
        echo "'./build.sh help' to get the list of arguments."
    fi
else
    help
fi
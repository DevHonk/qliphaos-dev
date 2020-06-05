#!/usr/bin/env bash

if [ `uname -s` != "Linux" ]; then
    echo "*** ERROR *** This script can be run only on a Linux environment!"
    exit 1
fi

ISO="Qlipha.iso"

QEMU_BIN="qemu-system-i386"
QEMU_ARGS="
-s -m 256M
-cpu max
-d cpu_reset,guest_errors
-smp 2
-device VGA,vgamem_mb=64
-device ich9-ahci
-debugcon stdio
-soundhw pcspk
-soundhw sb16
"

# Print help (show all args).
help () {
    echo "List of available arguments:"
    echo ""
    echo -e "\e[1mRUN \e[0m"
    echo -e "\tqemu \e[37m- Run with Qemu. \e[0m"
}

# Run with Qemu
run_qemu () {
    echo "Launch '$ISO' with args '$QEMU_ARGS'"
    $QEMU_BIN -cdrom $ISO $QEMU_ARGS
}

if [ ! -f "$ISO" ]; then
    echo "** ERROR ** '$ISO' not found!"
    exit 1
fi

if [ ! -z "$1" ]; then
    if [ "$1" == "help" ]; then
        help
    elif [ "$1" == "qemu" ]; then
        run_qemu
    else
        echo -e "\e[91mThis argument is not recognized! \e[0m"
        echo "'./run.sh help' to get the list of arguments."
    fi
else
    help
fi
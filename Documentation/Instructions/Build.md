## Build instructions

## Linux

**System Requirements**

* GCC >= v8
* Make
* Qemu / VirtualBox

#### Ubuntu / Debian

**Install Dependencies**

```bash
$ sudo apt-get install build-essential curl libmpfr-dev libmpc-dev libgmp-dev e2fsprogs xorriso qemu-system-i386 qemu-utils
```

Ensure your gcc version is >= 8 with `gcc --version`. Otherwise, install it with:

```bash
$ sudo add-apt-repository ppa:ubuntu-toolchain-r/test
$ sudo apt-get install gcc-9 g++-9
$ sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 900 --slave /usr/bin/g++ g++ /usr/bin/g++-9
```

---

**Build**

Go into the `Toolchain/` directory and run the `build.sh` script.

Build ISO:

```bash
$ ./build.sh build-iso
```

---

[Run instructions](https://github.com/Chaika9/qliphaos-dev/blob/master/Documentation/Instructions/Run.md)
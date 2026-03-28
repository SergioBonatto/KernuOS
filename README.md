# KernuOS

![WIP](https://img.shields.io/badge/status-work%20in%20progress-orange)

A small educational OS written in C, following [Little OS Book](https://littleosbook.github.io/) with custom kernel experiments.

> Everything here is subject to change — this is an active WIP.

## Run
```sh
    make clean
    make run

```


```sh
qemu-system-i386 -cdrom KernuOS.iso -m 32M
```

## Debug

**Terminal 1:**
```sh
qemu-system-i386 -cdrom KernuOS.iso -S -s
```

**Terminal 2:**
```sh
lldb kernel.elf
gdb-remote localhost:1234
continue
```

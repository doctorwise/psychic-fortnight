#!/usr/bin/env bash

# stolen shamelessly
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y qemu-user qemu-user-static gcc-aarch64-linux-gnu binutils-aarch64-linux-gnu binutils-aarch64-linux-gnu-dbg build-essential

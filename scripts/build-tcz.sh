#!/usr/bin/env bash
set -euo pipefail
KVER="${1:-6.12.112-pcp-n1}"
SRC="${2:-modules-tree}"
EXT="N1-KERNEL-${KVER}"
rm -rf tcz-root "${EXT}.tcz" "${EXT}.tcz.md5.txt" "${EXT}.tcz.sha256" "${EXT}.manifest.txt"
mkdir -p "tcz-root/usr/local/lib/modules/${KVER}"
cp -a "${SRC}/." "tcz-root/usr/local/lib/modules/${KVER}/"
mksquashfs tcz-root "${EXT}.tcz" -noappend -no-xattrs -no-exports -comp xz -b 131072
md5sum "${EXT}.tcz" > "${EXT}.tcz.md5.txt"
sha256sum "${EXT}.tcz" > "${EXT}.tcz.sha256"
unsquashfs -ll "${EXT}.tcz" > "${EXT}.manifest.txt"

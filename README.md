# S905-pCP-modules

Build a Tiny Core / piCorePlayer kernel-module `.tcz` extension for Phicomm N1.

Source artifacts are downloaded from:
https://github.com/mslovecc/S905-pCP-kernels/releases

The workflow consumes `modules-<kernel>-pcp-n1.tar.gz`, reconstructs
`/usr/local/lib/modules/<kernel>/`, builds a SquashFS `.tcz`, and validates
the module indexes.

Default source:
- release: `v0.4.2`
- bundle: `6.12.67.tar.gz`
- kernel: `6.12.112-pcp-n1`

Output:
- `N1-KERNEL-6.12.112-pcp-n1.tcz`
- MD5/SHA256
- manifest

The Raspberry Pi `modules-6.12.67-pcpCore-v8.gz` archive is deliberately
not used.

## v2 fix

The workflow recursively locates `modules-<kernel>.tar.gz` after extracting the
release bundle. This handles bundles that contain an additional directory layer,
such as `6.12.67/modules-6.12.112-pcp-n1.tar.gz`.

## v3 fix

The TCZ build step now prints squashfs-tools versions, module count, filesystem
size, and free space. It uses a conservative `mksquashfs` invocation and
separates archive creation, checksum generation, and manifest validation so the
actual failing command is visible in Actions logs.

## v4 diagnostic build

The TCZ build step is now split into explicit checkpoints. It avoids a
`find | wc -l` pipeline under `pipefail` and prints a checkpoint after every
filesystem operation, making failures in copy, module indexes, or SquashFS
creation directly visible in GitHub Actions.

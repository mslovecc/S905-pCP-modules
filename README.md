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

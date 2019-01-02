# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CRATES="
ansi_term-0.11.0
aho-corasick-0.5.3
argparse-0.2.1
atty-0.2.11
base64-0.4.0
bitflags-1.0.4
blake2-0.6.0
block-buffer-0.2.0
byteorder-1.2.7
byte-tools-0.2.0
bzip2-0.3.3
bzip2-sys-0.1.7
cfg-if-0.1.6
cc-1.0.28
chrono-0.4.6
clap-2.32.0
constant_time_eq-0.1.3
crossbeam-0.2.10
crypto-mac-0.4.0
dangerous_option-0.2.0
digest-0.6.0
env_logger-0.3.5
fake-simd-0.1.2
flate2-0.2.17
fs2-0.4.0
gcc-0.3.51
generic-array-0.8.0
glob-0.2.11
hex-0.2.0
isatty-0.1.9
kernel32-sys-0.2.2
libc-0.2.26
libsodium-sys-0.0.14
linked-hash-map-0.3.0
log-0.3.6
memchr-0.1.11
miniz-sys-0.1.9
nodrop-0.1.13
num_cpus-1.9.0
num-integer-0.1.39
num-traits-0.2.6
owning_ref-0.3.3
pkg-config-0.3.9
quote-0.3.8
rand-0.3.15
rdedup-2.0.0
rdedup-lib-2.0.0
rdedup-cdc-0.1.0
redox_syscall-0.1.16
redox_termios-0.1.1
regex-0.1.80
regex-syntax-0.3.9
rollsum-0.2.1
rpassword-0.2.3
rust-crypto-0.2.36
rust-lzma-0.2.1
rustc-serialize-0.3.22
same-file-0.1.1
serde-0.9.15
serde_codegen_internals-0.14.2
serde_derive-0.9.15
serde_yaml-0.6.2
sgdata-0.1.0
sha2-0.6.0
slog-2.4.1
slog-perf-0.2.0
slog-term-2.4.0
slog-async-2.3.0
strsim-0.7.0
sodiumoxide-0.0.14
stable_deref_trait-1.0.0
syn-0.11.11
synom-0.11.3
take_mut-0.2.2
term-0.5.1
termion-1.5.1
termios-0.2.2
textwrap-0.10.0
thread-id-3.0.0
thread_local-0.3.3
time-0.1.39
two-lock-queue-0.1.1
typenum-1.7.0
utf8-ranges-0.1.3
unicode-width-0.1.5
unicode-xid-0.0.4
unreachable-0.1.1
vec_map-0.8.1
void-1.0.2
walkdir-1.0.7
yaml-rust-0.3.5
zstd-0.4.14
zstd-safe-1.3.2
zstd-sys-1.3.2
winapi-0.2.8
winapi-0.3.6
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="data deduplication with compression and public key encryption"
HOMEPAGE="https://github.com/dpc/rdedup"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT=""
LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DEPEND="${DEPEND} >=dev-libs/libsodium-1.0.11"
RDEPEND="${DEPEND}"
DOCS=( README.md CHANGELOG.md )

src_prepare() {
	default_src_prepare
	ln -sf "${WORKDIR}/cargo_home/gentoo/rdedup-lib-${PV}" "${S}/lib"
}

src_install() {
	cargo_src_install
	einstalldocs
}

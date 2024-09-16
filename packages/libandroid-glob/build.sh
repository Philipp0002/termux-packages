TERMUX_PKG_HOMEPAGE=https://man7.org/linux/man-pages/man3/glob.3.html
TERMUX_PKG_DESCRIPTION="Symlink to libc for compatibility"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_VERSION=0.6
TERMUX_PKG_MAINTAINER="@termux"

termux_step_make() {
	cd "$TERMUX_PREFIX/lib"
	ln -f -s "/system/lib${TERMUX_ARCH_BITS}/libc.so" libandroid-glob.so
}

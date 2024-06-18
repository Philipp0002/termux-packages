TERMUX_PKG_HOMEPAGE=https://github.com/termux/termux-root-packages
TERMUX_PKG_DESCRIPTION="Package repository containing programs for rooted devices"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="Henrik Grimler @Grimler91"
TERMUX_PKG_VERSION=2.4
TERMUX_PKG_REVISION=3
TERMUX_PKG_AUTO_UPDATE=false
TERMUX_PKG_DEPENDS="termux-keyring"
TERMUX_PKG_SKIP_SRC_EXTRACT=true
TERMUX_PKG_PLATFORM_INDEPENDENT=true

termux_step_make_install() {
	mkdir -p $TERMUX_PREFIX/etc/apt/sources.list.d
	{
		echo "# The root termux repository"
		echo "deb https://root-packages.termux.net/ root main"
	} > $TERMUX_PREFIX/etc/apt/sources.list.d/root.list
}

termux_step_create_debscripts() {
	cat <<- EOF > ./postinst
	#!$TERMUX_PREFIX/bin/sh
	apt update
	exit 0
	EOF
}

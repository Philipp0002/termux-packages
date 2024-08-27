TERMUX_PKG_HOMEPAGE=https://github.com/KhronosGroup/Vulkan-ExtensionLayer
TERMUX_PKG_DESCRIPTION="Vulkan Extension Layer"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="1.3.294"
TERMUX_PKG_SRCURL=https://github.com/KhronosGroup/Vulkan-ExtensionLayer/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=2c95779543d726f619b3bbacec0c71b2e8660b16989c39c41d4050d609a1fab9
TERMUX_PKG_DEPENDS="libc++, vulkan-loader"
TERMUX_PKG_BUILD_DEPENDS="vulkan-headers (=${TERMUX_PKG_VERSION}), vulkan-utility-libraries (=${TERMUX_PKG_VERSION})"
TERMUX_PKG_ANTI_BUILD_DEPENDS="vulkan-loader"
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_UPDATE_VERSION_REGEXP="\d+\.\d+\.\d+"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DBUILD_TESTS=OFF
-DVULKAN_HEADERS_INSTALL_DIR=${TERMUX_PREFIX}
"

termux_pkg_auto_update() {
	local api_url="https://api.github.com/repos/KhronosGroup/Vulkan-ExtensionLayer/git/refs/tags"
	local latest_refs_tags=$(curl -s "${api_url}" | jq .[].ref | grep -oP v${TERMUX_PKG_UPDATE_VERSION_REGEXP})
	if [[ -z "${latest_refs_tags}" ]]; then
		echo "WARN: Unable to get latest refs tags from upstream. Try again later." >&2
		return
	fi
	local latest_version=$(echo "${latest_refs_tags}" | sort -V | tail -n1)
	termux_pkg_upgrade_version "${latest_version}"
}

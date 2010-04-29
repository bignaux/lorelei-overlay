# Distributed under the terms of the GNU General Public License v2
# Author : Ronan Bignaux
# Todo : check dependancies , add use : doc examples and custom conf for drivers
# move /usr/objdictgen/ and clean it from gnosis-utils

EAPI="2"

inherit mercurial

DESCRIPTION="ANSI-C platform independent CANOpen stack"
HOMEPAGE="http://www.canfestival.org/"
EHG_REPO_URI_BASE="http://lolitech.fr/dev"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_unpack() {
	if [ -n "$NOFETCH" ]; then
		EHG_PULL_CMD=/bin/true
		EHG_CLONE_CMD=/bin/true
	fi

	EHG_REPO_URI="${EHG_REPO_URI_BASE}/CanFestival-3"
	mercurial_src_unpack
}

S="${WORKDIR}/CanFestival-3"
src_prepare(){
	sed -i '/ldconfig/d' Makefile.in.tmp
}

src_configure(){
	# it's a custom configure , dont works with econf
	sh configure --prefix="${D}/usr/"
}

src_install() {
	make install || die
}

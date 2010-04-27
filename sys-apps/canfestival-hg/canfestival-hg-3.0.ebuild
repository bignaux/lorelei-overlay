# Distributed under the terms of the GNU General Public License v3
# Author : Ronan Bignaux
# Todo : check dependancies , add use : doc examples and custom conf for drivers
# move /usr/objdictgen/ and clean it from gnosis-utils

EAPI="2"

inherit mercurial 

DESCRIPTION="ANSI-C platform independent CANOpen® stack"
HOMEPAGE="http://www.canfestival.org/"
EHG_REPO_URI_BASE="http://lolitech.fr/dev"

LICENSE="GPLv2"
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
	mv Makefile.in Makefile.in.tmp
	sed "/ldconfig/d" Makefile.in.tmp > Makefile.in
}

src_configure(){
	# it's a custom configure , dont works with econf
	sh configure --prefix="${D}/usr/"
}

src_install() {
	make install || die
}

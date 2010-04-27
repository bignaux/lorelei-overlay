# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit mercurial 

DESCRIPTION="ANSI-C platform independent CANOpen® stack"
HOMEPAGE="http://www.canfestival.org/"
EHG_REPO_URI_BASE="http://lolitech.fr/dev"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPENDS="sys-devel/bison
	sys-devel/flex"
RDEPEND="${DEPEND}"

src_unpack() {
	if [ -n "$NOFETCH" ]; then
		EHG_PULL_CMD=/bin/true
		EHG_CLONE_CMD=/bin/true
	fi

	EHG_REPO_URI="${EHG_REPO_URI_BASE}/CanFestival-3"
	mercurial_src_unpack
}

S="${WORKDIR}/CanFestival-3"

src_compile() {
    # it's a custom configure , dont works with econf
    einfo "je fais de la merde"
    sh configure
    make || die
}

src_install() {
    make install || die
}

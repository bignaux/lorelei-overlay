# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils autotools

DESCRIPTION="a IEC 61131-3 compiler"
HOMEPAGE="http://www.beremiz.org/"
LICENSE="GPL-3"
SLOT="0"

if [[ ${PV} == "9999" ]] ; then
	inherit mercurial
	EHG_REPO_URI_BASE="http://dev.automforge.net/"
	EHG_REPO_URI="${EHG_REPO_URI_BASE}/${PN}"
	KEYWORDS="~amd64 ~x86"
else
	inherit vcs-snapshot
	SRC_URI="
	   http://dev.automforge.net/${PN}/archive/tip.tar.bz2 -> ${P}.tar.bz2"
fi

IUSE=""

DEPENDS="sys-devel/bison
	sys-devel/flex"

src_prepare() {
    epatch "${FILESDIR}/${P}-autotools.patch"
    epatch "${FILESDIR}/${P}-libdir.patch"
    eautoreconf
}

src_install() {
	exeinto /usr/bin
	doexe iec2c iec2iec || die "Install failed"

	dodir /usr/share/${PN}
	cp -a "${S}"/lib/ "${D}/usr/share/${PN}" || die "Install failed!"
}

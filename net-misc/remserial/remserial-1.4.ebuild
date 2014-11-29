# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=5

WANT_AUTOCONF="latest"
WANT_AUTOMAKE="latest"

inherit eutils 

DESCRIPTION="Serial To Network Proxy"
SRC_URI="http://lpccomp.bc.ca/remserial/${P}.tar.gz"
HOMEPAGE="http://lpccomp.bc.ca/remserial/"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="GPL-2"

IUSE=""

src_install() {
	exeinto /usr/sbin
	doexe remserial || die "install failed"
	dodoc README.txt
}

# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils

DESCRIPTION="a loop-free distance-vector routing protocol"
HOMEPAGE="http://www.pps.jussieu.fr/~jch/software/babel/"
SRC_URI="http://www.pps.jussieu.fr/~jch/software/files/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_compile() {
	emake PREFIX=/usr "CDEBUGFLAGS=${CFLAGS}" all || die "build failed"
}

src_install(){
	exeinto /usr/sbin
	doexe babeld || die "install failed"
	dodoc CHANGES README || die "dodoc failed"
	mv ${PN}.man ${PN}.8
	doman ${PN}.8 || die "doman failed"

	# Empty dir
	dodir /etc/babeld
	keepdir /etc/babeld
	insinto /etc/babeld ; doins "${FILESDIR}/${PN}.conf"

	keepdir /var/run/babeld/
	keepdir /var/log/babeld/
}

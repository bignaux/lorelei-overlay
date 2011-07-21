# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils

DESCRIPTION="set up a default route if a host is reachable"
HOMEPAGE="http://www.pps.jussieu.fr/~jch/software/babel/"
SRC_URI="http://www.pps.jussieu.fr/~jch/software/files/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="net-misc/babeld"

src_install(){
	exeinto /usr/sbin
	doexe ${PN} || die "install failed"
	mv ${PN}.man ${PN}.8
	doman ${PN}.8 || die "doman failed"
}

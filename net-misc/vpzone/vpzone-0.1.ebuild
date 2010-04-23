# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils

DESCRIPTION="A flexible, IPv6 layer 3 VPN daemon"
HOMEPAGE="http://www.vpzone.org/"
SRC_URI="http://www.vpzone.org/files/${P}.tar.bz2"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug"

DEPEND="=dev-libs/libevent-1.4*
		net-misc/babeld"

src_configure() {

	econf $(use_enable debug) --prefix=/usr || die "Configure failed"

}

src_compile() {

	emake || die "Make all failed"

}

src_install() {

	emake DESTDIR="${D}" install || die "Make install failed"

	find "${D}" -name '*.la' -delete

	dodoc CHANGES README || die "dodoc failed"

	doman doc/${PN}.8 || die "doman failed"
	doman doc/${PN}.conf.8 || die "doman failed"

}

# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit flag-o-matic eutils

DESCRIPTION="A flexible, IPv6 layer 3 VPN daemon"
HOMEPAGE="http://www.vpzone.org/"
EHG_REPO_URI="http://vpzone.hg.sourceforge.net/hgweb/vpzone/vpzone/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug"

IUSE=""

DEPEND="dev-libs/libevent
		>=net-dns/c-ares-1.4
		net-misc/babeld
		net-libs/gnutls"

EHG_PROJECT="vpzone"

CONFIG_CHECK="~TUN"
ERROR_TUN="CONFIG_TUN:	needed for vpzone virtual network interfaces."

src_prepare() {
	./autogen.sh || die "autogen.sh failed"
}

src_configure() {

	local myconf
	#myconf="$(use_enable ares)"
	econf ${myconf}
}

pkg_setup() {

	enewgroup vpzone

}

src_compile() {

	emake || die "Make all failed"

}

src_install() {

	emake DESTDIR="${D}" install || die "Make install failed"

	find "${D}" -name '*.la' -delete

	dodoc Changelog README || die "dodoc failed"

	doman doc/${PN}.8 || die "doman failed"
	doman doc/${PN}.conf.8 || die "doman failed"

	# Empty dir
	dodir /etc/vpzone
	keepdir /etc/vpzone

	keepdir /var/run/vpzone/
	fperms 0750 /var/run/vpzone/
	fowners root:vpzone /var/run/vpzone/

	keepdir /var/log/vpzone/
	fperms 0750 /var/log/vpzone/
	fowners root:vpzone /var/log/vpzone/
}

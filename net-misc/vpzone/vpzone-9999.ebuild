# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils mercurial

DESCRIPTION="A flexible, IPv6 layer 3 VPN daemon"
HOMEPAGE="http://www.vpzone.org/"
EHG_REPO_URI="http://vpzone.hg.sourceforge.net/hgweb/vpzone/vpzone/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="dev-libs/libevent
		>=net-dns/c-ares-1.4
		net-misc/babeld
		net-libs/gnutls"

EHG_PROJECT="vpzone"

src_prepare() {
	./autogen.sh || die "autogen.sh failed"
}

pkg_setup() {

	enewgroup vpzone

}

src_configure() {

	econf $(use_enable debug) --prefix=/usr || die "Configure failed"

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

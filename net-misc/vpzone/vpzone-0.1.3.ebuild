# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit flag-o-matic eutils

DESCRIPTION="A flexible, IPv6 layer 3 VPN daemon"
HOMEPAGE="http://www.vpzone.org/"
SRC_URI="http://downloads.sourceforge.net/project/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug"

IUSE=""

DEPEND="dev-libs/libevent
		>=net-dns/c-ares-1.4
		net-misc/babeld
		net-libs/gnutls"

CONFIG_CHECK="~TUN"
ERROR_TUN="CONFIG_TUN:	needed for vpzone virtual network interfaces."

src_prepare() {

	epatch "${FILESDIR}/dns-overflow.patch"
	epatch "${FILESDIR}/gnutls-checkpeer.patch"
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

	# Install the init script
	newinitd "${FILESDIR}/${PN}.init" vpzone

	keepdir /var/run/vpzone/
	fperms 0750 /var/run/vpzone/
	fowners root:vpzone /var/run/vpzone/

	keepdir /var/log/vpzone/
	fperms 0750 /var/log/vpzone/
	fowners root:vpzone /var/log/vpzone/
}

pkg_postinst() {
	
	einfo "The vpzone init script expects to find the configuration file"
	einfo "vpzone.conf in /etc/vpzone along with any extra files it may need."
	einfo ""
	einfo "To create more VPNs, simply create a new .conf file for it and"
	einfo "then create a symlink to the vpzone init script from a link called"
	einfo "vpzone.newconfname - like so"
	einfo " cd /etc/vpzone"
	einfo " ${EDITOR##*/} foo.conf"
	einfo " cd /etc/init.d"
	einfo " ln -s vpzone vpzone.foo"
	einfo ""
	einfo "You can then treat vpzone.foo as any other service, so you can"
	einfo "stop one vpn and start another if you need to."
	einfo "To run as non-root, add yourself to the vpzone group:"
	einfo " gpasswd -a <user> vpzone"
}

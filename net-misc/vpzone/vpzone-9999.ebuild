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

IUSE="gnutls ssl "

RDEPEND="ldap? ( net-nds/openldap )
	ssl? (
		gnutls? ( net-libs/gnutls dev-libs/libgcrypt app-misc/ca-certificates )
		nss? ( !gnutls? ( dev-libs/nss app-misc/ca-certificates ) )
		!gnutls? ( !nss? ( dev-libs/openssl ) )
	)
	idn? ( net-dns/libidn )
	ares? ( >=net-dns/c-ares-1.6 )
	kerberos? ( virtual/krb5 )
	libssh2? ( >=net-libs/libssh2-0.16 )"

DEPEND="${RDEPEND}
	sys-apps/ed
	test? (
		sys-apps/diffutils
		dev-lang/perl
	)"



DEPEND="dev-libs/libevent
		>=net-dns/c-ares-1.4
		net-misc/babeld
		net-libs/gnutls"

EHG_PROJECT="vpzone"

# ares must be disabled for threads and both can be disabled
# one can use wether gnutls or nss if ssl is enabled
REQUIRED_USE="threads? ( !ares )
	gnutls? ( ssl )
	nss? ( ssl )"

src_prepare() {
	./autogen.sh || die "autogen.sh failed"
}

src_configure() {
	local myconf

	myconf="$(use_enable ares)"

	if use ssl ; then
		if use gnutls; then
			myconf+=" --without-ssl --with-gnutls --without-nss"
			myconf+=" --with-ca-bundle=${EPREFIX}/etc/ssl/certs/ca-certificates.crt"
		elif use nss; then
			myconf+=" --without-ssl --without-gnutls --with-nss"
			myconf+=" --with-ca-bundle=${EPREFIX}/etc/ssl/certs/ca-certificates.crt"
		else
			myconf+=" --without-gnutls --without-nss --with-ssl"
			myconf+=" --without-ca-bundle --with-ca-path=${EPREFIX}/etc/ssl/certs"
		fi
	else
		myconf+=" --without-gnutls --without-nss --without-ssl"
	fi

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


# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

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

	# Install the init script
	newinitd "${FILESDIR}/${PN}.init" babeld

	keepdir /var/run/babeld/
	keepdir /var/log/babeld/
}

pkg_postinst() {
	einfo "The babeld init script expects to find the configuration file"
	einfo "babeld.conf in /etc/babeld along with any extra files it may need."
	einfo ""
	einfo "To create more babeld instance, simply create a new .conf file for it and"
	einfo "then create a symlink to the babeld init script from a link called"
	einfo "babeld.newconfname - like so"
	einfo "   cd /etc/babeld"
	einfo "   ${EDITOR##*/} foo.conf"
	einfo "   cd /etc/init.d"
	einfo "   ln -s babeld babeld.foo"
	einfo ""
	einfo "You can then treat babeld.foo as any other service, so you can"
	einfo "stop one babeld and start another if you need to."
	einfo "If no interface option is found in foo.conf, init script try interface foo"
}

# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
SUPPORT_PYTHON_ABIS="1"
PYTHON_COMPAT=( python2_7 python3_{3,4} )

inherit distutils

DESCRIPTION="Crossbar.io - Polyglot application router"
HOMEPAGE="http://crossbar.io/"
SRC_URI="https://github.com/crossbario/crossbar/archive/v${PV}.tar.gz"

LICENSE="AGPL-3"
KEYWORDS="~amd64"
SLOT="0"
IUSE="manhole msgpack postgres system tls"

DEPEND="dev-python/setuptools"
RDEPEND="
	>=dev-python/autobahn-0.8.9
	>=dev-python/jinja-2.7.2
	>=dev-python/netaddr-0.7.11
	>=dev-python/setuptools-2.2
	>=dev-python/twisted-core-13.2
	dev-python/zope-interface
	dev-python/setuptools
	manhole? ( >=dev-python/pyasn1-0.1.7 )
	manhole? ( >=dev-python/pycrypto-2.6.1 )
	msgpack? ( >=dev-python/msgpack-python-0.4.2 )
	postgres? ( >=dev-python/psycopg-2.5.1 )
	system? ( >=dev-python/psutil-2.1.1 )
	system? ( >=dev-python/pyinotify-0.9.4 )
	system? ( >=dev-python/setproctitle-1.1.8 )
	tls? ( >=dev-python/cryptography-0.4 )
	tls? ( >=dev-python/pyopenssl-0.14 )
	tls? ( dev-python/pyasn1 )
	tls? ( dev-python/pyasn1-modules )
	tls? ( dev-python/service-identity )"

S=${WORKDIR}/${P}/${PN}

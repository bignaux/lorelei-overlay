# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="A keyboard training program which I'm designing for my 9 year old son."
HOMEPAGE="http://code.google.com/p/key-train/"
SRC_URI="http://key-train.googlecode.com/files/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="dev-python/pyyaml
	dev-python/pygtk
	dev-python/dbus-python
	dev-python/python-xlib
	x11-proto/recordproto
	dev-python/librsvg-python"

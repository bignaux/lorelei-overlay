# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# TODO : theme not available , keymap , kernel event dependancie.

EAPI="2"

inherit eutils distutils

DESCRIPTION="Utility to show live keyboard and mouse status for teaching and screencasts."
HOMEPAGE="http://code.google.com/p/key-mon/"
SRC_URI="http://key-mon.googlecode.com/files/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="${RDEPEND}
	dev-python/setuptools
	dev-python/pygtk
	dev-python/dbus-python"

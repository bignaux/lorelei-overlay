# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="*"
SUPPORT_PYTHON_ABIS="1"

inherit eutils python distutils

DESCRIPTION="Python implementation of the Sane API (using ctypes) and abstration layer."
HOMEPAGE="https://github.com/jflesch/pyinsane"
SRC_URI="https://github.com/jflesch/pyinsane/archive/v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPENDS=""

# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="2:2.7"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit eutils python distutils

DESCRIPTION="A Python wrapper for Tesseract and Cuneiform"
HOMEPAGE="https://github.com/jflesch/pyocr"
SRC_URI="https://github.com/jflesch/pyocr/archive/v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPENDS=""



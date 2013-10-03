# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="A Python wrapper for Tesseract and Cuneiform"
HOMEPAGE="https://github.com/jflesch/pyocr"
SRC_URI="https://github.com/jflesch/pyocr/archive/v${PV}.tar.gz"

LICENSE="GPL-3"
IUSE="cuneiform tesseract"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPENDS="cuneiform? ( app-text/cuneiform )
    tesseract?  (app-text/tesseract)
    dev-python/pillow"

# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="HOCR manipulation and utility library; provides hocr2pdf binary"
HOMEPAGE="https://github.com/concordusapps/python-hocr"
SRC_URI="https://github.com/concordusapps/python-hocr/archive/${PV}.tar.gz"

LICENSE="MIT"
IUSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPENDS="dev-python/six
    dev-python/lxml
    dev-python/python-hummus
    dev-python/pillow"
    #filemagic ?
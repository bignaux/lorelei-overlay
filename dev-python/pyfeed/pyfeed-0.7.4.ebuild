# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="*"

inherit eutils python distutils

DESCRIPTION="modules contain tools for working with syndication feeds."
HOMEPAGE="http://home.avvanta.com/~steveha/pyfeed.html"
SRC_URI="http://www.blarg.net/%7Esteveha/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPENDS="dev-python/xe"

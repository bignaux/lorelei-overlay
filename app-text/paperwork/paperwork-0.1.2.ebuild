# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1 

DESCRIPTION="Paperwork is a tool to make papers searchable."
HOMEPAGE="https://github.com/jflesch/paperwork"
SRC_URI="https://github.com/jflesch/${PN}/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""

RDEPEND="dev-python/wxpython
	dev-python/pygobject
	dev-util/glade[introspection]
	dev-python/pycountry
	app-text/poppler
	dev-python/pycairo
	dev-python/pyenchant
	dev-python/python-levenshtein
	dev-python/whoosh
	dev-python/nltk
	dev-python/pillow
	dev-python/pyinsane
	dev-python/pyocr
	x11-libs/gtk+"

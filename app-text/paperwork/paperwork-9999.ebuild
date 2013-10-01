# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# Ronan Bignaux
# TODO : clear about tesseract/cuneiform and ocr dependancies

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

EGIT_REPO_URI="git://github.com/jflesch/${PN}.git
	http://github.com/jflesch/${PN}/"
EGIT_BRANCH="stable"

inherit distutils-r1 git-2

DESCRIPTION="Paperwork is a tool to make papers searchable."
HOMEPAGE="https://github.com/jflesch/paperwork"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-vcs/git"

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
	media-gfx/sane-backends
	media-gfx/sane-frontends
	media-gfx/xsane
	app-text/tesseract
	x11-libs/gtk+"

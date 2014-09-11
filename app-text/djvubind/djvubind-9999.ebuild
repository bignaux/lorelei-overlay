# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python3_{2,3,4} )

EGIT_REPO_URI="git://github.com/strider1551/${PN}.git
	http://github.com/strider1551/${PN}/"
	
inherit distutils-r1 git-2

DESCRIPTION="Create highly compressed djvu files with positional ocr, metadata, and bookmarks."
HOMEPAGE="https://github.com/strider1551/djvubind"
IUSE="tesseract minidjvu cuneiform"

LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="media-gfx/imagemagick
		dev-python/python-djvulibre
		tesseract? ( app-text/tesseract )
		minidjvu?  ( app-text/minidjvu )
		cuneiform? ( app-text/cuneiform )"

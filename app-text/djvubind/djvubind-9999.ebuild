# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python3_2 )
inherit distutils-r1 mercurial

DESCRIPTION="Create highly compressed djvu files with positional ocr, metadata, and bookmarks."
HOMEPAGE="https://code.google.com/p/djvubind/"
EHG_REPO_URI="https://code.google.com/p/djvubind/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="app-text/minidjvu"

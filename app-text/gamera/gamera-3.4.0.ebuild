# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="a framework for building document analysis applications."
HOMEPAGE="http://gamera.informatik.hsnr.de"
SRC_URI="http://sourceforge.net/projects/gamera/files/gamera/gamera-3.4.0/gamera-3.4.0.tar.gz"

LICENSE="GPL-2"
IUSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPENDS="dev-python/wxpython
    media-libs/libpng
    python-docutils 
    python-pygments"
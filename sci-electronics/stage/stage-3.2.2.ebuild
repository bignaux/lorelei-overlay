# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit cmake-utils

DESCRIPTION="2D multiple-robot simulator."
HOMEPAGE="http://playerstage.sourceforge.net/index.php?src=stage"
SRC_URI="mirror://sourceforge/playerstage/Stage-${PV}-Source.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="doc"

RDEPEND=">=x11-libs/fltk-1.1:1.1
	sci-electronics/player
	media-libs/libpng
	sys-devel/libtool
	x11-apps/rgb"
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )"

S="${WORKDIR}/Stage-${PV}-Source"

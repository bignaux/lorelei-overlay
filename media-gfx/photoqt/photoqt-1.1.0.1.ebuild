# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit cmake-utils 

DESCRIPTION="Simple but powerful Qt5-based image viewer"
HOMEPAGE="http://photoqt.org"
SRC_URI="http://photoqt.org/pkgs/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="graphicsmagick exiv2"

DEPEND="dev-qt/qtmultimedia:5
		dev-qt/qtgui:5
		dev-qt/qtnetwork:5
		exiv2? ( media-gfx/exiv2 )
		graphicsmagick? ( media-gfx/graphicsmagick )"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use graphicsmagick GM)
		$(cmake-utils_use exiv2 EXIV2)
		)
	cmake-utils_src_configure
}

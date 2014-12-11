# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit qmake-utils

DESCRIPTION="Image Viewer and Organizer"
HOMEPAGE="https://gitorious.org/phototonic"
if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="git://gitorious.org/phototonic/phototonic.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/oferkv/phototonic/archive/v${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-1"
SLOT="0"
IUSE="tiff svg"

RDEPEND="dev-qt/qtwidgets:5	
	dev-qt/qtgui:5
	dev-qt/qtcore:5
	tiff? ( dev-qt/qtimageformats:5 )
	svg? ( dev-qt/qtsvg:5 )
	media-gfx/exiv2"
DEPEND="${RDEPEND}"

src_configure() {
	local project_file=$(qmake-utils_find_pro_file)
    eqmake5 "${project_file}"
}

src_install() {
	emake install INSTALL_ROOT="${D}"
}

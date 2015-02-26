# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 

EAPI=5

inherit qmake-utils

DESCRIPTION="Digital rythmo band system for dubbing and postsynchronisation purposes."
HOMEPAGE="https://github.com/Phonations/Joker"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="git://github.com/Phonations/${PN}.git"
	KEYWORDS=""
else
	SRC_URI=""
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${PN}-${P}"
fi

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# add ffmpeg[]
# media-video/libav
DEPEND="virtual/libusb:0
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		media-libs/rtmidi
		media-libs/portaudio
		media-libs/libltc
		media-libs/libsdl2
		media-libs/sdl2-ttf
		media-libs/sdl2-image
		"
RDEPEND="${DEPEND}"

src_prepare() {
	# remove bugged 3-rd party
	# should not git submodules!
	rm -fr vendor/rtmidi/
}

src_configure() {
	eqmake5 all.pro
}

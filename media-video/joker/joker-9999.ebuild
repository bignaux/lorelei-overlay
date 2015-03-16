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
IUSE="libav"

# TODO :
# * complete ffmpeg[] libvo-aacenc,
# ,ffplay,freetype,frei0r,libass,\
# 			libcaca,vorbis,vpx,openjpeg,openssl,opus,rtmp,schroedinger,\
# 			speex,theora,tools]
# # others qt5
RDEPEND="
        	libav? ( >=media-video/libav-10:0=[aac] )
        	!libav? ( >=media-video/ffmpeg-2.1.4:0=[aac] )
        	dev-qt/qtcore:5
        	dev-qt/qtgui:5
        	media-libs/libltc
        	media-libs/libsdl2
        	media-libs/portaudio
        	media-libs/rtmidi
        	media-libs/sdl2-image
        	media-libs/sdl2-ttf
		"
DEPEND="${RDEPEND}"

src_prepare() {
      epatch "${FILESDIR}/libasound.patch"
      # TODO remove bugged 3-rd party
	# should not git submodules!
	# rm -fr vendor/rtmidi/
}

src_configure() {
	eqmake5 all.pro
}

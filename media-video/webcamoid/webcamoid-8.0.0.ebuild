# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=5
inherit qmake-utils

DESCRIPTION="a full featured webcam capture application."
HOMEPAGE="https://webcamoid.github.io"

SRC_URI="https://github.com/webcamoid/webcamoid/tarball/${PV} -> ${P}.tar.gz"
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}/webcamoid-webcamoid-3710641"


LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"


RDEPEND="
            dev-qt/qtcore:5
            dev-qt/qtgui:5
            media-video/ffmpeg
            media-libs/gstreamer
            media-video/v4l2loopback
            
		"

DEPEND="${RDEPEND}"

src_configure() {
	eqmake5 Webcamoid.pro PREFIX="${D}"/usr
}

src_install() {
    emake INSTALL_ROOT="${D}" install || die
}
#* ACCESS DENIED:  mkdir:        /usr/lib64/qt5/qml/AkQml

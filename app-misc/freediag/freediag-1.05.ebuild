# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

DESCRIPTION="Vehicle diagnostic protocols and an OBD II (mostly) compliant ScanTool."
HOMEPAGE="http://freediag.sourceforge.net/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="fltk"

DEPEND="fltk? ( x11-libs/fltk:1 )"

SRC_URI="https://github.com/fenugrec/freediag/archive/R1_05.tar.gz"
S=${WORKDIR}/freediag-R1_05

src_prepare() {
    if use fltk ; then
        #src/examples does not include fltk flags
        append-cflags $(fltk-config --cflags)
        append-cxxflags $(fltk-config --cxxflags)
    fi
}

src_configure() {
        local mycmakeargs=(
                $(cmake-utils_use fltk BUILDGUI) 
        )

        cmake-utils_src_configure
}

# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games
DESCRIPTION="Board game in 3D"
HOMEPAGE="http://saschahlusiak.de/blokus"
SRC_URI="http://saschahlusiak.de/blokus/${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"

KEYWORDS="~x86 ~amd64"
IUSE="X dedicated"

DEPEND=""
RDEPEND=""

src_compile() {
	egamesconf $(use_with dedicated) $(use_with X gui) || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	if use X ; then
		newicon src/freebloks.png ${PN}.png
		make_desktop_entry freebloks Freebloks\ 3D ${PN}.png
	fi

	prepgamesdirs
}

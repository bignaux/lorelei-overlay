# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib qt4-r2

DESCRIPTION="Qt4 Connman Applet"
HOMEPAGE="https://bitbucket.org/devonit/qconnman"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/OSSystems/${PN}.git"
	KEYWORDS=""
else
	SRC_URI=""
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="LGPL-2.1+"
SLOT="0"

IUSE=""

DEPEND="net-misc/qconnman"
RDEPEND="${DEPEND}"

src_configure() {
	eqmake4 \
		PREFIX="${EPREFIX}/usr" \
		LIBDIR="$(get_libdir)"
}

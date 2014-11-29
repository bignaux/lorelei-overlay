# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib qt4-r2

DESCRIPTION="Qt4 Connman Applet"
HOMEPAGE="https://bitbucket.org/devonit/qconnman"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://bitbucket.org/devonit/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://bitbucket.org/devonit/qconnman/get/v${PV}.tar.bz2"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/devonit-qconnman-6b9d09ba7401"
fi

LICENSE="LGPL-2.1+"
SLOT="0"

### TODO: add static-libs and qt5 support
IUSE=""

DEPEND="
	dev-qt/qtcore:4
	dev-qt/qtdbus:4
	dev-qt/qtgui:4
	net-misc/connman
"
RDEPEND="${DEPEND}"

DOCS="AUTHORS README"

src_configure() {
	eqmake4 \
		PREFIX="${EPREFIX}/usr" \
		LIBDIR="$(get_libdir)"
}

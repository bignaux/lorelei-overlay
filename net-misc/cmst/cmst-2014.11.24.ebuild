# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib qt5-build

DESCRIPTION="QT GUI for Connman with system tray icon"
HOMEPAGE="https://github.com/andrew-bibb/cmst"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/andrew-bibb/cmst/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/andrew-bibb/cmst/archive/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${PN}-${P}"
fi

LICENSE="MIT"
SLOT="0"

IUSE=""

DEPEND="dev-qt/qtcore:5"
RDEPEND="net-misc/connman
		${DEPEND}"

src_install() {
	exeinto /usr/bin
	doexe ${WORKDIR}/cmst-opensource-src-${PV}/apps/cmstapp/cmst || die "doexe failed"
	doman ${S}/misc/manpage/${PN}.1
	doicon ${S}/images/application/cmst.png
	domenu ${S}/icons/${PN}.desktop
}

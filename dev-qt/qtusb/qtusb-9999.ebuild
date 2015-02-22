# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 

EAPI=5

inherit qt4-r2 git-2

DESCRIPTION="A Multi-platform USB Library for QT."
HOMEPAGE="https://github.com/fpoussin/QtUsb"

EGIT_REPO_URI="git://github.com/fpoussin/${PN}.git
	http://github.com/fpoussin/${PN}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/libusb:0
		dev-qt/qtcore:4
		dev-qt/qtgui:4"
RDEPEND="${DEPEND}"

S="${WORKDIR}/QtUsb-${PV}"

# Copyright 2010-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit cmake-utils

DESCRIPTION="An end-user Qt4 GUI for the cpp-ethereum crypto-currency"
HOMEPAGE="https://www.ethereum.org/"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="git://github.com/ethereum/cpp-ethereum.git"
	KEYWORDS=""
else
	SRC_URI=""
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT ISC GPL-3 LGPL-2.1 public-domain || ( CC-BY-SA-3.0 LGPL-2.1 )"
SLOT="0"
KEYWORDS=""
IUSE="$IUSE qt5"

RDEPEND="
	qt5? (
		dev-qt/qtdeclarative:5
		dev-qt/qtwebkit:5
	)
	>=dev-libs/boost-1.53.0[threads(+)]
	>=dev-libs/crypto++-5.6.2
	net-libs/miniupnpc
	dev-libs/gmp
	dev-libs/libjson-rpc-cpp"

DEPEND="${RDEPEND}"

src_configure() {
        local mycmakeargs=(
				-DCMAKE_BUILD_TYPE=Release
				-DHEADLESS=1
        )

		#use qt5 || mycmakeargs="${mycmakeargs} -DHEADLESS=1"
        cmake-utils_src_configure
}
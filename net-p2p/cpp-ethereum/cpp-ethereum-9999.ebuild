# Copyright 2010-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

DESCRIPTION="An end-user Qt4 GUI for the cpp-ethereum crypto-currency"
HOMEPAGE="https://www.ethereum.org/"
SRC_URI="
"
EGIT_PROJECT='cpp-ethereum'
EGIT_REPO_URI="git://github.com/ethereum/cpp-ethereum.git https://github.com/ethereum/cpp-ethereum.git"

LICENSE="MIT ISC GPL-3 LGPL-2.1 public-domain || ( CC-BY-SA-3.0 LGPL-2.1 )"
SLOT="0"
KEYWORDS=""
IUSE="$IUSE qt5"

RDEPEND="
	>=dev-libs/boost-1.53.0[threads(+)]
	dev-libs/libjson-rpc-cpp
	qt5? (
		dev-qt/qtquick1:5
	)
"
DEPEND="${RDEPEND}
	>=app-shells/bash-4.1
"

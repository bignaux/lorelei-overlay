# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 

EAPI=5

inherit cmake-utils

DESCRIPTION="This framework provides cross platform JSON-RPC"
HOMEPAGE="https://github.com/cinemast/libjson-rpc-cpp"
SRC_URI="https://github.com/cinemast/libjson-rpc-cpp/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm hppa ppc ppc64 x86 ~amd64-fbsd ~x86-fbsd"
IUSE="debug doc test"

RDEPEND=""
DEPEND="${RDEPEND}
	dev-libs/jsoncpp
	net-misc/curl[ssl]
	dev-libs/argtable
	"

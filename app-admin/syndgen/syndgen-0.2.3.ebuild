# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=5
PYTHON_MULTIPLE_ABIS="1"
PYTHON_COMPAT=( python{2_7,3_2} )

inherit distutils-r1

DESCRIPTION="A distant Gentoo synchronizer helper"
HOMEPAGE="http://tuna.lyua.org/syndgen/"
SRC_URI="mirror://sourceforge/syndgen/files/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="net-misc/rsync net-misc/openssh app-portage/gentoolkit"

PYTHON_MODNAME="syndgen"

src_install()
{
    cd ${S}
    distutils-r1_src_install
    doman doc/syndgen.1
}

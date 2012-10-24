# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# Todo : check dependancies , add use : doc examples and custom conf for drivers

EAPI="3"

inherit mercurial

DESCRIPTION="ANSI-C platform independent CANOpen stack"
HOMEPAGE="http://www.canfestival.org/"
EHG_REPO_URI_BASE="http://dev.automforge.net/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+socket +wxwidgets"
DEPEND="wxwidgets? ( dev-python/wxpython )"

src_unpack() {
	if [ -n "$NOFETCH" ]; then
		EHG_PULL_CMD=/bin/true
		EHG_CLONE_CMD=/bin/true
	fi

	EHG_REPO_URI="${EHG_REPO_URI_BASE}/CanFestival-3"
	mercurial_src_unpack
}

S="${WORKDIR}/CanFestival-3"

src_prepare(){
	sed -i '/ldconfig/d' Makefile.in
}

src_configure(){
	# it's a custom configure , dont works with econf
	local confcmd="./configure
		--cc=${CBUILD}-gcc
		--cxx=${CBUILD}-g++
		--prefix='${D}/usr/'
		$(use socket && echo '--can=socket')
		$(use socket || echo '--can=virtual_kernel')
		$(use wxwidgets && echo '--wx=1')
		$(use wxwidgets || echo '--wx=0')"
	echo ${confcmd}
	${confcmd} || die "configure failed"
}

src_install() {
	make install || die
}

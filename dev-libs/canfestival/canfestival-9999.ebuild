# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit toolchain-funcs

DESCRIPTION="ANSI-C platform independent CANOpen stack"
HOMEPAGE="http://www.canfestival.org/"
EHG_REPO_URI_BASE="http://dev.automforge.net"
MY_PN="CanFestival-3"
S="${WORKDIR}/${MY_PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples objdictgen socket wxwidgets"

RDEPEND="objdictgen? ( dev-python/gnosis-utils )"
DEPEND="${RDEPEND}
        wxwidgets? ( dev-python/wxpython:2.8 )"

if [[ ${PV} == "9999" ]] ; then
	inherit mercurial
	EHG_REPO_URI_BASE="http://dev.automforge.net/"
	EHG_REPO_URI="${EHG_REPO_URI_BASE}/${MY_PN}"
	KEYWORDS="~amd64 ~x86"
else
	inherit vcs-snapshot
	SRC_URI="
	   http://dev.automforge.net/${PN}/archive/tip.tar.bz2 -> ${P}.tar.bz2"
fi

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
		$(use examples && echo '--can=socket')
		$(use socket || echo '--can=virtual_kernel')
		$(use wxwidgets && echo '--wx=1')
		$(use wxwidgets || echo '--wx=0')"
	echo ${confcmd}
	${confcmd} || die "configure failed"
	
    #remove bundled dev-python/gnosis-utils
	#emake -f objdictgen/Makefile mrproper
}

#src_compile() {
#	emake canfestival
#    use examples && emake examples
#	use objdictedit && emake objdictedit
#}

src_install() {
	make install || die
}

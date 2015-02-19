# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit eutils

DESCRIPTION="Open Source framework for automation"
HOMEPAGE="http://www.beremiz.org/"

if [[ ${PV} == "9999" ]] ; then
	inherit mercurial
	EHG_REPO_URI_BASE="http://dev.automforge.net/"
	EHG_REPO_URI="${EHG_REPO_URI_BASE}/${PN}"
	KEYWORDS="~amd64 ~x86"
else
	inherit vcs-snapshot
	SRC_URI="
	   http://dev.automforge.net/${PN}/archive/tip.tar.bz2 -> ${P}.tar.bz2"
fi

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="canfestival doc twisted"

RDEPEND="dev-python/wxpython:2.8
		dev-python/numpy
		dev-python/nevow
		dev-python/simplejson
		dev-util/wxglade
		dev-python/pyro:3
		dev-lang/matiec
		canfestival? ( sys-apps/canfestival \
		               dev-python/gnosis-utils )
		twisted? ( dev-python/twisted-core )"

src_prepare() {
    epatch "${FILESDIR}/beremiz-fix-wxversion.patch"
}

src_install() {
	insinto /usr/share/${PN}
	doins -r * || die "Install failed!"
	
    #insinto /usr/share/applications
	#doins debian/{beremiz{_doc,_svgui,_wxglade},beremiz}.desktop

	fperms 0755 /usr/share/"${PN}"/Beremiz.py
	dosym /usr/share/"${PN}"/Beremiz.py /usr/bin/beremiz
	
	# Install icon and desktop file
	newicon "images/brz.png" "${PN}.png"
    make_desktop_entry /usr/bin/beremiz "Beremiz" "${PN}" "Development"

	if use doc; then
		dohtml -r doc/*
	fi
}
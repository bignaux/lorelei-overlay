# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# * don't rely on canfestival ( USE )

EAPI=5

inherit eutils mercurial

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
IUSE="doc"

#dev-python/ctypes
RDEPEND="dev-python/gnosis-utils
		dev-python/wxpython
		dev-python/twisted-core
		dev-python/numpy
		dev-python/nevow
		dev-python/simplejson
		dev-util/wxglade
		dev-python/pyro:3
		sys-apps/canfestival"
		#dev-lang/matiec
		#dev-python/twisted find right dependancies
#S="${WORKDIR}/beremiz"

src_install() {
	dodir /usr/share/${PN}
	doins -r * "${D}/usr/share/${PN}" || die "Install failed!"
	
	insinto ${D}
	doins -r *

	insinto /usr/share/applications
	doins "${S}"/debian/{beremiz{_doc,_svgui,_wxglade},beremiz}.desktop

	fperms 755 ${D}/Beremiz.py
	dosym ${D}/Beremiz.py /usr/bin/beremiz

	if use doc; then
		dohtml -r doc/*
	fi
}

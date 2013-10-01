# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# * don't rely on canfestival ( USE )

EAPI=5

inherit eutils mercurial

DESCRIPTION="Open Source framework for automation"
HOMEPAGE="http://www.beremiz.org/"
EHG_REPO_URI_BASE="http://dev.automforge.net/"

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
S="${WORKDIR}/beremiz"
DEST="/usr/share/beremiz"

src_unpack() {
	if [ -n "$NOFETCH" ]; then
		EHG_PULL_CMD=/bin/true
		EHG_CLONE_CMD=/bin/true
	fi

	EHG_REPO_URI="${EHG_REPO_URI_BASE}/beremiz"
	mercurial_src_unpack
}

src_install() {
	dodir ${DEST}
	insinto ${DEST}
	doins -r *

	insinto /usr/share/applications
	doins "${S}"/debian/{beremiz{_doc,_svgui,_wxglade},beremiz}.desktop

	fperms 755 ${DEST}/Beremiz.py
	dosym ${DEST}/Beremiz.py /usr/bin/beremiz

	if use doc; then
		dohtml -r doc/*
	fi
}

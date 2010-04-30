# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
# TODO : find a trick for docutils ( this lib should be renamed to avoid name conflict )
# * don't rely on canfestival ( USE )

EAPI="2"

inherit eutils mercurial

DESCRIPTION="Open Source framework for automation"
HOMEPAGE="http://www.beremiz.org/"
EHG_REPO_URI_BASE="http://lolitech.fr/dev"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

#dev-python/ctypes
RDEPEND="dev-python/gnosis-utils
		dev-python/wxpython
		dev-python/numpy
		dev-python/twisted
		dev-python/nevow
		dev-python/simplejson
		dev-util/wxglade
		dev-python/pyro
		sys-apps/canfestival-hg
		dev-lang/matiec-hg
		dev-python/xmlclass-hg
		dev-util/plcopeneditor-hg
		app-text/docutils-hg"

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

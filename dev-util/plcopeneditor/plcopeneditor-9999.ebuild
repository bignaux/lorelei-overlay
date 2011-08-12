# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# TODO : clean dependancies

EAPI="3"

inherit eutils mercurial

DESCRIPTION="Open Source framework for automation"
HOMEPAGE="http://www.beremiz.org/"
EHG_REPO_URI_BASE="http://dev.automforge.net/"

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
		sys-apps/canfestival
		dev-lang/matiec
		dev-python/xmlclass
		app-text/docutils"

S="${WORKDIR}/plcopeneditor"
DEST="/usr/share/plcopeneditor"

src_unpack() {
	if [ -n "$NOFETCH" ]; then
		EHG_PULL_CMD=/bin/true
		EHG_CLONE_CMD=/bin/true
	fi

	EHG_REPO_URI="${EHG_REPO_URI_BASE}/plcopeneditor"
	mercurial_src_unpack
}

src_install() {
	dodir ${DEST}
	insinto ${DEST}
	doins -r *

	insinto /usr/share/applications
	doins "${S}"/debian/plcopeneditor.desktop

	fperms 755 ${DEST}/PLCOpenEditor.py
	dosym ${DEST}/PLCOpenEditor.py /usr/bin/plcopeneditor

	if use doc; then
		dohtml -r doc/*
	fi
}

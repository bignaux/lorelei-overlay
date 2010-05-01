# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# Ronan Bignaux

EAPI="2"

inherit eutils mercurial

DESCRIPTION="Open Source framework for automation"
HOMEPAGE="http://www.beremiz.org/"
EHG_REPO_URI_BASE="http://lolitech.fr/dev"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

RDEPEND="dev-python/wxpython"

S="${WORKDIR}/docutils"
DEST="/usr/share/docutils"

src_unpack() {
	if [ -n "$NOFETCH" ]; then
		EHG_PULL_CMD=/bin/true
		EHG_CLONE_CMD=/bin/true
	fi

	EHG_REPO_URI="${EHG_REPO_URI_BASE}/docutils"
	mercurial_src_unpack
}

src_install() {
	dodir ${DEST}
	insinto ${DEST}
	doins -r *.py
}

# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils mercurial

DESCRIPTION="Open Source framework for automation"
HOMEPAGE="http://www.beremiz.org/"
EHG_REPO_URI_BASE="http://lolitech.fr/dev"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

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
		dev-lang/matiec-hg"

src_unpack() {
	if [ -n "$NOFETCH" ]; then
		EHG_PULL_CMD=/bin/true
		EHG_CLONE_CMD=/bin/true
	fi

	repos="beremiz plcopeneditor xmlclass docutils"
	for repo in ${repos}; do 
		EHG_REPO_URI="${EHG_REPO_URI_BASE}/"${repo}
		mercurial_src_unpack
	done
}


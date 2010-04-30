# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils mercurial distutils
MY_P="xmlclass"

DESCRIPTION="a library implementing an XSD schema based model for MVC generator."
HOMEPAGE="http://www.beremiz.org/"
EHG_REPO_URI_BASE="http://lolitech.fr/dev"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="${RDEPEND}
	dev-python/setuptools"
RESTRICT_PYTHON_ABIS="3.*"

PYTHON_MODNAME="${MY_P/-/_}"
S="${WORKDIR}/${MY_P}"

src_unpack() {
	if [ -n "$NOFETCH" ]; then
		EHG_PULL_CMD=/bin/true
		EHG_CLONE_CMD=/bin/true
	fi

	EHG_REPO_URI="${EHG_REPO_URI_BASE}/xmlclass"
	mercurial_src_unpack
}

src_install() {
	distutils_src_install

	if use doc; then
		dohtml -r docs/*
	fi
}

# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils mercurial toolchain-funcs

DESCRIPTION="a IEC 61131-3 compiler"
HOMEPAGE="http://www.beremiz.org/"
EHG_REPO_URI_BASE="http://lolitech.fr/dev"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPENDS="sys-devel/bison
	sys-devel/flex"

src_unpack() {
	if [ -n "$NOFETCH" ]; then
		EHG_PULL_CMD=/bin/true
		EHG_CLONE_CMD=/bin/true
	fi

	EHG_REPO_URI="${EHG_REPO_URI_BASE}/matiec"
	mercurial_src_unpack
}

S="${WORKDIR}/matiec"

src_install() {
	exeinto /usr/bin
	doexe iec2c iec2iec || die "install failed"
}

# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# Todo : check dependancies , add use : doc examples and custom conf for drivers

EAPI="2"

inherit mercurial

DESCRIPTION="ANSI-C platform independent CANOpen stack"
HOMEPAGE="http://www.canfestival.org/"
EHG_REPO_URI_BASE="http://lolitech.fr/dev"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPENDS="dev-python/gnosis-utils
	dev-python/wxpython"

src_unpack() {
	if [ -n "$NOFETCH" ]; then
		EHG_PULL_CMD=/bin/true
		EHG_CLONE_CMD=/bin/true
	fi

	EHG_REPO_URI="${EHG_REPO_URI_BASE}/CanFestival-3/objdictgen"
	mercurial_src_unpack
}

DEST="/usr/share/objdictgen"
S="${WORKDIR}/objdictgen/objdictgen"

src_prepare(){
	rm Gnosis_Utils-current.tar.gz
	rm -fr gnosis
	rm Makefile*
}

src_install() {
	dodir ${DEST}
	insinto ${DEST}
	doins -r *

	fperms 755 ${DEST}/objdictedit.py
	dosym ${DEST}/objdictedit.py /usr/bin/objdictedit

	fperms 755 ${DEST}/objdictgen.py
	dosym ${DEST}/objdictgen.py /usr/bin/objdictgen

	if use doc; then
		dohtml -r doc/*
	fi
}

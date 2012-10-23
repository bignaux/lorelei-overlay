# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# Todo : check dependancies , add use : doc examples and custom conf for drivers

EAPI="2"

inherit mercurial autotools

DESCRIPTION="ANSI-C platform independent CANOpen stack"
HOMEPAGE="http://www.canfestival.org/"
EHG_REPO_URI_BASE="http://dev.automforge.net/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPENDS="dev-python/gnosis-utils
	dev-python/wxpython"

src_unpack() {
	S="${WORKDIR}"
	if [ -n "$NOFETCH" ]; then
		EHG_PULL_CMD=/bin/true
		EHG_CLONE_CMD=/bin/true
	fi

	EHG_REPO_URI="${EHG_REPO_URI_BASE}/CanFestival-3"
	mercurial_src_unpack
}

DEST="/usr/share/objdictgen"
S="${WORKDIR}/objdictgen"

src_prepare(){
	cd "${WORKDIR}"
	rm objdictgen/Gnosis_Utils-current.tar.gz
	rm -fr objdictgen/gnosis
	# rm Makefile*
	eautomake

}
src_configure(){
	cd "${WORKDIR}/objdictgen"
	econf
}

src_compile(){
	cd "${WORKDIR}/objdictgen"
	emake
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

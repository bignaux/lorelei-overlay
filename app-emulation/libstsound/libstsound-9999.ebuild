# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit libtool eutils subversion 

DESCRIPTION="emulating an AY-3-8912 chip"
HOMEPAGE="http://code.google.com/p/cpcsdk/"

ESVN_REPO_URI="http://cpcsdk.googlecode.com/svn/trunk/${PN}"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

S="${WORKDIR}/${PN}"

src_prepare(){
	sh build_config.sh
}

src_install() {
	emake DESTDIR="${D}" install || die "Make install failed"
}


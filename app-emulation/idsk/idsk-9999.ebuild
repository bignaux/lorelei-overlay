# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils subversion 

DESCRIPTION="manipulating dsk images and files inside"
HOMEPAGE="http://code.google.com/p/cpcsdk/"

ESVN_REPO_URI="http://cpcsdk.googlecode.com/svn/trunk/iDSK"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

S="${WORKDIR}/iDSK"

src_prepare(){
	sh build_config.sh
}

src_install() {
	emake DESTDIR="${D}" install || die "Make install failed"
}


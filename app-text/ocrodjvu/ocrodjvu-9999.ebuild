# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/mercurial/mercurial-1.0.2.ebuild,v 1.7 2008/10/17 08:04:41 aballier Exp $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )
inherit distutils-r1 mercurial

DESCRIPTION="a wrapper for OCR systems, that allows you to perform OCR on DjVu files."
HOMEPAGE="http://jwilk.net/software/ocrodjvu"
SRC_URI=""
EHG_REPO_URI="https://bitbucket.org/jwilk/ocrodjvu"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="dev-python/html5lib"
DEPEND=""
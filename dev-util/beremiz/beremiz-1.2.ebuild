# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="ssl(+)?,xml(+)"

inherit eutils python-r1
#distutils-r1

DESCRIPTION="Open Source framework for automation"
HOMEPAGE="http://www.beremiz.org/"

if [[ ${PV} == "9999" ]] ; then
	inherit mercurial
	EHG_REPO_URI_BASE="http://dev.automforge.net/"
	EHG_REPO_URI="${EHG_REPO_URI_BASE}/${PN}"
else
	inherit vcs-snapshot
	SRC_URI="
	   http://dev.automforge.net/${PN}/archive/tip.tar.bz2 -> ${P}.tar.bz2"
fi

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="canfestival doc +twisted"

DEPEND="${RDEPEND}"

RDEPEND="
	canfestival? ( dev-libs/canfestival
		               dev-python/gnosis-utils[${PYTHON_USEDEP}] )
	twisted? ( dev-python/twisted-core[${PYTHON_USEDEP}]
		           dev-python/autobahn[${PYTHON_USEDEP}]  )
	dev-python/wxpython[${PYTHON_USEDEP}]
	dev-python/nevow[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pyro:3[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-util/wxglade"

DEPEND="${RDEPEND}
	doc? (
		dev-python/sphinx
		dev-python/sphinx-better-theme
	)"

src_install() {
	insinto /usr/share/${PN}
	doins -r * || die "Install failed!"
 	
	#insinto /usr/share/applications
	#doins debian/{beremiz{_doc,_svgui,_wxglade},beremiz}.desktop
 
	python_setup
	python_fix_shebang "${ED}"/usr/share/${PN}
        fperms 0755 /usr/share/${PN}/Beremiz.py /usr/share/${PN}/Beremiz_service.py /usr/share/${PN}/PLCOpenEditor.py
        dosym /usr/share/${PN}/Beremiz.py /usr/bin/beremiz
 	
	# Install icon and desktop file
	newicon "images/brz.png" "${PN}.png"
        make_desktop_entry "${PN}" "${PN}" "${PN}" "Development"
 
#	if use doc; then
#		docinto doc
#		dodoc doc/{index.rst,overview.rst,standards.rst}
#		docinto manual
#		dodoc doc/manual/{build.rst,debug.rst,edit.rst,index.rst,install.rst,start.rst}
#		#dohtml -r doc/*
#	fi
}
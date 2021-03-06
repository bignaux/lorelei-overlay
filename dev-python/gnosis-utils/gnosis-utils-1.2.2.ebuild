# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/gnosis-utils/gnosis-utils-1.2.2.ebuild,v 1.7 2014/08/10 21:11:51 slyfox Exp $

EAPI="5"
PYTHON_COMPAT=( python2_7 )
inherit distutils-r1 eutils

MY_P=Gnosis_Utils-${PV}

DESCRIPTION="XML pickling and objectification with Python"
HOMEPAGE="http://www.gnosis.cx/download/"
SRC_URI="http://www.gnosis.cx/download/${MY_P}.tar.gz"

LICENSE="PYTHON"
SLOT="0"
KEYWORDS="~amd64 ia64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${MY_P}"

src_prepare() {
	distutils-r1_src_prepare

	#epatch "${FILESDIR}/${P}-setup.py.patch"

	# This setup.py installs files according to the MANIFEST.
	# MANIFEST shouldn't be installed to avoid collisions.
	rm -f MANIFEST || die "rm failed"
	sed -i \
		-e "/MANIFEST/d" \
		-e "/gnosis\/doc/d" \
		MANIFEST.in || die "sed failed"

	sed -e "s/with/with_/" -i gnosis/util/convert/pyfontify.py || die "sed failed"
}

python_test() {
	"${PYTHON}" gnosis/xml/pickle/test/test_all.py || die "Tests fail with ${EPYTHON}"
}

python_install_all() {

	dodoc README gnosis/doc/{*.txt,readme,GETTING_HELP,*ANNOUNCE}
	newdoc gnosis/anon/README README.anon
	newdoc gnosis/xml/relax/README README.relax.xml

	distutils-r1_python_install_all

	delete_README() {
		rm -f "${ED}$(python_get_sitedir)/README"
	}
	python_execute_function -q delete_README
}

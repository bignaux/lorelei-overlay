# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# could be improve adding test and doc flags ...

EAPI=3

DESCRIPTION="z88dk - z80 Development Kit ."
HOMEPAGE="http://www.z88dk.org/forum/index.php"
SRC_URI="http://nightly.z88dk.org/${P}.tgz"

LICENSE="Clarified-Artistic"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${PN}"
export DESTDIR="${D}"
export prefix="/usr"

src_compile() {
    cd ${S}
	./build.sh || die "build.sh failed!"
	emake -e || die "failed to build!"
	emake -e libs || die "failed to build libs!"
}

src_install() {
	# this installs lib too
	emake -e install || die "failed to install"

	dodir /usr/lib/
	dosym /usr/share/z88dk /usr/lib/
}

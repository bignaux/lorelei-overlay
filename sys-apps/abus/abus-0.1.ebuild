EAPI=4

inherit toolchain-funcs

DESCRIPTION="A-Bus is a simple inter-process communication (IPC) system for embedded applications"
HOMEPAGE="http://code.google.com/p/abus/"
SRC_URI="http://abus.googlecode.com/files/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="fcgi"

RDEPEND="fcgi? ( dev-libs/fcgi )"
DEPEND="${RDEPEND}"	

src_configure() {
    if use fcgi; then
	    myconf="${myconf} --enable-fcgi"
    fi

    econf ${myconf}
}

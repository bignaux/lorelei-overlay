# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI="3"
PYTHON_DEPEND="2"

inherit distutils eutils python

DESCRIPTION="A python framework for easily exploring advanced topics in artificial intelligence and robotics."
HOMEPAGE="http://pyrorobotics.org/"
SRC_URI="http://pyrorobotics.org/download/${P}.tgz"

IUSE="tk ipython player stage"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
DEPEND="dev-lang/swig"

RDEPEND="dev-python/imaging
	 dev-python/numpy
	 ipython? ( dev-python/ipython )
	 tk? ( dev-lang/python[tk?] )
	 stage? ( sci-electronics/stage )
	 player? ( sci-electronics/player )"

MAKEOPTS="-j1"

S="${WORKDIR}/${PN}"

pkg_setup()
{
	if ! has_version dev-python/imaging[tk]; then
		eerror "dev-python/imaging was not built with USE='tk'"
		die "Please rebuild dev-python/imaging with tk support"
	fi
}

src_unpack()
{
	unpack ${A}
	epatch "${FILESDIR}/${P}.patch"
	cd "${S}"

	# generate Makefile.cfg
	PYTHON_INC="/usr/include/python$(python_get_version)"
	PYTHON=`which python`
	X11_INC="/usr/include/X11"
	PLAYER_INC=`find /usr/include/ -name "player-2.*" -type d`
	echo "PYTHON_VERSION=$(python_get_version)" >> Makefile.cfg
	echo "PYTHON_BIN=${PYTHON}" >> Makefile.cfg
	echo "PYTHON_INCLUDE=-I${PYTHON_INC}" >> Makefile.cfg
	echo "X11_DIR=${X11_INC}" >> Makefile.cfg
	echo "PLAYER_INCLUDE=-I${PLAYER_INC}" >> Makefile.cfg
	echo "CONFIGDIRS=camera/device vision/cvision camera/v4l camera/bt848 camera/fake camera/blob \
		camera/aibo camera/robocup  camera/fourway camera/stereo brain/psom \
		brain/psom/csom_src/som_pak-dev tools/cluster" >> Makefile.cfg
# failed : camera/player
}

src_compile()
{
	cd "${S}"

	emake || die "Compilation failed"
}

src_install()
{
	cd "${S}"

	# The installation is so unclean that it is installed on opt
	# instead of /usr/lib/python$(python_get_version)/site-packages/pyrobot
	install_dir="/opt/pyrobot"
	dodir "${install_dir}"

	cd "${S}"
	for elt in `find * -type f ! -name "*.h" -a ! -name "*.c" -a ! -name \
		"*.cc" -a ! -name "*.cpp" -a ! -name "*.rpo" -a ! -name "*.i" -a \
		! -name "*.pyc" -a ! -name "*.php" -a ! -name "*.html" -a ! -name "*Makefile*"`
	do
		if [ "${elt%/*}" = "${elt}" ]
		then
			insinto "${install_dir}"
		else
			insinto "${install_dir}/${elt%/*}"
		fi
		doins "${elt}"
		if [ -x "${elt}" ]
		then
			fperms 755 "${install_dir}/${elt}"
		fi
	done

	echo "#!/usr/bin/env sh" >> pyrobot
	echo "export PYROBOT=${install_dir}" >> pyrobot
	echo "export PYTHONPATH=$PYTHONPATH:$PYROBOT/bin" >> pyrobot
	echo "python ${install_dir}/bin/pyrobot & exit" >> pyrobot

	dobin pyrobot
}

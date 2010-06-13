# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit cmake-utils

DESCRIPTION="A network server for robot control"
HOMEPAGE="http://playerstage.sourceforge.net/index.php?src=player"
SRC_URI="mirror://sourceforge/playerstage/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

#DRIVERS NOT INCLUDED
#	nd            - unknown
#	passthrough   - unknown
#   artoolkitplus - needs arToolKitPlus (not in portage)
#	garcia        - needs Garcia (not in portage)
#	imageseq      - needs openCV (not in portage)
#	shapetracker  - needs openCV (not in portage)
#	simpleshape   - needs openCV (not in portage)
#	upcbarcode    - needs openCV (not in portage)
#	isense        - needs iSense (not in portage)
#	nomad         - needs Creative Nomad (maybe in portage)
#	yarpimage     - needs YarpCam (not in portage)
#	rcore_xbridge - needs libparticle (not in portage)

IUSE="ieee1394 sphinx2 wifi v4l test
	boost gnome gtk openssl festival
	opengl glut gsl java python doc"

RDEPEND="media-libs/jpeg
	opengl? ( virtual/opengl )
	glut? ( virtual/glut )
	openssl? ( dev-libs/openssl )
	imagemagick? ( media-gfx/imagemagick )
	gsl? ( sci-libs/gsl )
	python? ( dev-lang/python )
	ieee1394? ( sys-libs/libraw1394 media-libs/libdc1394 )
	java? ( virtual/jdk dev-lang/python )
	gtk? ( x11-libs/gtk+ )
	gnome? ( >=gnome-base/libgnomecanvas-2.0 )
	boost? ( dev-libs/boost )
	sphinx2? ( app-accessibility/sphinx2 )
	festival? ( app-accessibility/festival )"

DEPEND="${RDEPEND}
	python? ( dev-lang/swig )
	java? ( dev-lang/swig )
	doc? ( app-doc/doxygen )"

# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 

EAPI="5"

JAVA_PKG_IUSE="source"
inherit java-pkg-2 java-ant-2

DESCRIPTION="Open Source ECU Tuning"
HOMEPAGE="http://www.romraider.com"
SRC_URI="https://github.com/RomRaider/RomRaider/archive/0.5.8-RC1.tar.gz"

LICENSE="GPL-2"
SLOT="0"
#KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=virtual/jdk-1.6
"
RDEPEND="
	>=virtual/jre-1.6
"

EANT_BUILD_TARGET="all"
#EANT_GENTOO_CLASSPATH="ant-core"
#JAVA_ANT_REWRITE_CLASSPATH="true"

S=${WORKDIR}/RomRaider-0.5.8-RC1

#src_install() {
#	java-pkg_dojar ${PN}.jar
#	java-pkg_dolauncher ${PN} --jar ${PN}.jar
#	use source && java-pkg_dosrc src/*
#}

# make some zip , perharps could use it to install in /opt/
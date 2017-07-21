# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=5
inherit qmake-utils

DESCRIPTION="Scriptable data terminal which supports several interfaces."
HOMEPAGE="http://scriptcommunicator.sourceforge.net/"

#MY_PV=R$(replace_version_separator 1 '_')
MY_PV="05_02"
SRC_URI="https://sourceforge.net/projects/scriptcommunicator/files/Source/ScriptCommunicator_${MY_PV}_source.zip/download -> ${P}.zip"
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}/ScriptCommunicator_${MY_PV}_source"


LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"


#dev-libs/quazip[qt5]
RDEPEND="
            dev-qt/qtcore:5
            dev-qt/qtgui:5
            dev-qt/qtsql:5
            dev-qt/qtwidgets:5
            dev-qt/qtnetwork:5
            dev-qt/qtxml:5
            dev-qt/qtserialport:5
            dev-qt/qtscript:5[scripttools]
            dev-qt/qtprintsupport:5
            dev-qt/designer:5
		"

DEPEND="${RDEPEND}"

#src_prepare() {
#	rm -fr quazip designer
#}

src_configure() {
	eqmake5 ScriptCommunicator.pro
}

#TODO : install target ...

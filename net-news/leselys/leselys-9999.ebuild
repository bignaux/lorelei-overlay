# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

EGIT_REPO_URI="git://github.com/socketubs/${PN}.git
	http://github.com/socketubs/${PN}/"

inherit distutils-r1 git-2

DESCRIPTION="leselys is your very elegant RSS reader."
HOMEPAGE="https://github.com/socketubs/leselys"
SRC_URI=""

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""

RDEPEND="dev-python/docopt
	dev-python/flask
	dev-python/feedparser
    dev-libs/libxml2
	dev-python/itsdangerous
	dev-python/requests
	dev-python/celery
	dev-python/pymongo
    dev-python/anyjson
    dev-python/py-bcrypt"
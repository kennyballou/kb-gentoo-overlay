# Copyright 2016 Kenny Ballou
# Distributed under the terms of the GNU General Public License v3
# $Id$

EAPI=6
PYTHON_COMPAT=(python2_7)

inherit distutils-r1

MY_P=${PN}_${PV}

DESCRIPTION="Sync github, bitbucket, and trac issues with taskwarrior"
HOMEPAGE="https://github.com/ralphbean/bugwarrior"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]
		 dev-python/offtrac[${PYTHON_USEDEP}]
		 dev-python/python-bugzilla[${PYTHON_USEDEP}]
		 >=dev-python/taskw-0.8[${PYTHON_USEDEP}]
		 dev-python/python-dateutil[${PYTHON_USEDEP}]
		 dev-python/pytz[${PYTHON_USEDEP}]
		 dev-python/keyring[${PYTHON_USEDEP}]
		 dev-python/six[${PYTHON_USEDEP}]
		 >=dev-python/jinja-2.7.2[${PYTHON_USEDEP}]
		 >=dev-python/dogpile-cache-0.5.3[${PYTHON_USEDEP}]
		 >=dev-python/lockfile-0.9.1[${PYTHON_USEDEP}]
		 dev-python/click[${PYTHON_USEDEP}]
		 dev-python/pyxdg[${PYTHON_USEDEP}]
		 dev-python/Twiggy[${PYTHON_USEDEP}]
		 test? ( dev-python/nose[${PYTHON_USEDEP}]
				 dev-python/mock[${PYTHON_USEDEP}]
				 dev-python/responses[${PYTHON_USEDEP}] )"
DEPEND="${RDEPEND}
		dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	nosetests || die
}

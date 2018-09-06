# Copyright 2016 Kenny Ballou
# Distributed under the terms of the GNU General Public License v3
# $Id$

EAPI=6
PYTHON_COMPAT=(python2_7)

inherit distutils-r1

MY_P=${PN}_${PV}

DESCRIPTION="Python API for the Taskwarrior command line tool"
HOMEPAGE="https://github.com/ralphbean/taskw"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

RDEPEND="dev-python/six[${PYTHON_USEDEP}]
		 dev-python/python-dateutil[${PYTHON_USEDEP}]
		 dev-python/pytz[${PYTHON_USEDEP}]
		 dev-python/kitchen[${PYTHON_USEDEP}]
		 test? ( dev-python/nose[${PYTHON_USEDEP}]
				 dev-python/tox[${PYTHON_USEDEP}] )"
DEPEND="${RDEPEND}
		dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	nosetests || die
}

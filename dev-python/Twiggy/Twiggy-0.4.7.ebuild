# Copyright 2016 Kenny Ballou
# Distributed under the terms of the GNU General Public License v3
# $Id$

EAPI=6
PYTHON_COMPAT=(python2_7 python3_{3,4} pypy)

inherit distutils-r1

MY_P=${PN}_${PV}

DESCRIPTION="Twiggy is a pythonic logger"
HOMEPAGE="https://github.com/wearpants/twiggy"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

RDEPEND="test? ( dev-python/pytest[${PYTHON_USEDEP}]
				 dev-python/pytest-cov[${PYTHON_USEDEP}]
				 dev-python/unittest2[${PYTHON_USEDEP}]
				 dev-python/tox[${PYTHON_USEDEP}] )"
DEPEND="${RDEPEND}
		dev-python/setuptools[${PYTHON_USEDEP}]"

src_prepare() {
	pushd "${S}"
	mv tests twiggy/.
	rm -r doc scripts
	popd
	distutils-r1_python_prepare_all
}

python_test() {
	tox || die
}

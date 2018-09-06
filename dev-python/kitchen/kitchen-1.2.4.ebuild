# Copyright 2016 Kenny Ballou
# Distributed under the terms of the GNU General Public License v3
# $Id$

EAPI=6
PYTHON_COMPAT=(python2_7 python3_{3,4})

inherit distutils-r1

MY_P=${PN}_${PV}

DESCRIPTION="Kitchen contains a cornucopia of useful code"
HOMEPAGE="https://fedorahosted.org/kitchen/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

RDEPEND="test? ( dev-python/nose[${PYTHON_USEDEP}] )"
DEPEND="${RDEPEND}
		dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	nosetests || die
}

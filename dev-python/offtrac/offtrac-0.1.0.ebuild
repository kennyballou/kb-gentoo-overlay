# Copyright 2016 Kenny Ballou
# Distributed under the terms of the GNU General Public License v3
# $Id$

EAPI=6
PYTHON_COMPAT=(python2_7 python3_3 python3_4)

inherit distutils-r1

MY_P=${PN}_${PV}

DESCRIPTION="Trac rpcxml library"
HOMEPAGE="https://fedorahosted.org/offtrac/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}
		dev-python/setuptools[${PYTHON_USEDEP}]"

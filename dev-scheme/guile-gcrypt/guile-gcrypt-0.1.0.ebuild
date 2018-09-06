# Copyright 2018 Kenny Ballou
# Distributed under the terms of the GNU General Public License v3

EAPI=6

DESCRIPTION="Guile bindings to Libgcrypt"
HOMEPAGE="https://notabug.org/cwebber/guile-gcrypt"
SRC_URI="https://notabug.org/cwebber/guile-gcrypt/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-scheme/guile-2.0.0
         >=dev-libs/libgcrypt-1.8.3"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${PN}

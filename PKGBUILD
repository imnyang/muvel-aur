pkgname=muvel
pkgver=2.11.3
pkgrel=4
pkgdesc="A storytelling tool for everyone"
arch=('x86_64')
url="https://github.com/KimuSoft/muvel-public"
license=(
  'Unlicense'
  'custom:muvel'
)
depends=(
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'pango'
  'webkit2gtk-4.1'
)
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("https://github.com/KimuSoft/muvel-public/releases/download/v2.11.3/Muvel_2.11.3_amd64.deb")
sha256sums_x86_64=("3c31f9c5860b6a5d697d938b28c1d3e7f15a98a101a17e9c8cf5384c7cbbcaed")
package() {
  tar -xvf data.tar.gz -C "${pkgdir}"

  sed -i \
    -e 's|^Exec=.*|Exec=muvel %u|' \
    -e 's|^MimeType=.*|MimeType=application/vnd.muvel.novel+json;application/vnd.muvel.episode+json;application/vnd.muvel.wiki+json;application/vnd.muvel.memo+json;x-scheme-handler/muvel;|' \
    "${pkgdir}/usr/share/applications/Muvel.desktop"
}

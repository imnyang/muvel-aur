pkgname=muvel
pkgver=2.10.6
pkgrel=4
pkgdesc="A storytelling tool for everyone"
arch=('x86_64')
url="https://github.com/KimuSoft/muvel-public"
license=('MIT')
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
source_x86_64=("https://github.com/KimuSoft/muvel-public/releases/download/v2.10.6/Muvel_2.10.6_amd64.deb")
sha256sums_x86_64=("ff121b30d813d19578176db924d1e8b727e413f59222c7db0703231a95e3c4ee")
package() {
  tar -xvf data.tar.gz -C "${pkgdir}"

  sed -i \
    -e 's|^Exec=.*|Exec=muvel %u|' \
    -e 's|^MimeType=.*|MimeType=application/vnd.muvel.novel+json;application/vnd.muvel.episode+json;application/vnd.muvel.wiki+json;application/vnd.muvel.memo+json;x-scheme-handler/muvel;|' \
    "${pkgdir}/usr/share/applications/Muvel.desktop"
}
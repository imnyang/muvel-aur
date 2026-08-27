pkgname=muvel
pkgver=2.11.4
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
source_x86_64=("https://github.com/KimuSoft/muvel-public/releases/download/v2.11.4/Muvel_2.11.4_amd64.deb")
sha256sums_x86_64=("6703a978ea2d2bb86f06d9ab6f3dcc37ac2aead51b9bcc33fd7e575b099e63b1")
package() {
  tar -xvf data.tar.gz -C "${pkgdir}"

  sed -i \
    -e 's|^Exec=.*|Exec=muvel %u|' \
    -e 's|^MimeType=.*|MimeType=application/vnd.muvel.novel+json;application/vnd.muvel.episode+json;application/vnd.muvel.wiki+json;application/vnd.muvel.memo+json;x-scheme-handler/muvel;|' \
    "${pkgdir}/usr/share/applications/Muvel.desktop"
}

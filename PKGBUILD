pkgname=muvel
pkgver=2.10.6
pkgrel=1
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
sha256sums_x86_64=("/xIbMNgT0ZV4F225JNHotyfkE/WSIsfbBwMjGpXjxO4=")
package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}

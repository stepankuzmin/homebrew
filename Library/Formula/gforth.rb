require 'formula'

class Gforth < Formula
  homepage 'http://www.gnu.org/software/gforth/'
  url 'http://www.complang.tuwien.ac.at/forth/gforth/gforth-0.7.3.tar.gz'
  sha256 '2f62f2233bf022c23d01c920b1556aa13eab168e3236b13352ac5e9f18542bb0'

  depends_on 'libtool' => :run
  depends_on 'libffi'
  depends_on 'pcre'

  def install
    cp Dir["#{Formula["libtool"].opt_share}/libtool/config/config.*"], buildpath
    ENV.deparallelize
    system "./configure", "--prefix=#{prefix}"
    system "make" # Separate build steps.
    system "make install"
  end
end

class Despotify < Formula
  desc "Open-source Spotify client"
  homepage "http://despotify.sourceforge.net/"
  head "https://svn.code.sf.net/p/despotify/code/src"

  depends_on "pkg-config" => :build
  depends_on "libao"
  depends_on "libvorbis"
  depends_on "mpg123"
  depends_on "openssl"
  depends_on "libtool" => :run

  def install
    system "make", "Makefile.local.mk"
    inreplace "Makefile.local.mk", "# INSTALL_PREFIX = /usr", "INSTALL_PREFIX = #{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    shell_output("#{bin}/despotify-simple -h", 1)
  end
end

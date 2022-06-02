class AARCH64LinuxGNUToolchain < Formula
    desc "Toolchain for MacOS targetting aarch64-unknown-linux-gnu (includes gcc, gbb, linux headers, glic and binutils)"
    homepage "https://thinkski.github.io/osx-arm-linux-toolchains/"
    url "https://github.com/thinkski/osx-arm-linux-toolchains/releases/download/8.3.0/aarch64-unknown-linux-gnu.tar.xz"
    version "8.3.0"
    sha256 "9110fd08eb1fe1625fb7f495145a408db55efe6f9d6338bc4fd7a4c3057b86f6"
    revision 1
  
    def install
        
    end
  
    test do
      system "aarch64-unknown-linux-gnu-gcc", "--version"
    end
  end
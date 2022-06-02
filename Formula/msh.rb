# require 'formula'
require "os"

class Msh < Formula
  desc "The msh Interpreter as shell program."
  homepage "https://github.com/Max2github/mshgit"
  url "https://github.com/Max2github/mshgit/archive/refs/tags/shell.tar.gz"
  sha256 "4539ee486980b010e6945562d126ea50c27278d701c182cb91daed6b763b9920"
  license "MIT"
  version "1.0.1"
  #version "Shell program"

  # depends_on "cmake" => :build
  depends_on : os

  def install
    puts RUBY_PLATFORM
    puts os.host_cpu
    if os.mac? && os.host_cpu == "x86_64"
      system "cp other/mac_x86_64/all.o o/lib/all.o"
    elsif os.mac? && os.host_cpu == "arm64"
      system "cp other/mac_arm/all.o o/lib/all.o"
    elsif os.linux? && os.host_cpu == "arm64"
      system "cp other/linux_arm/all.o o/lib/all.o"
    elsif os.linux? && os.host_cpu == "x86_64"
      system "cp other/linux_x86_64/all.o o/lib/all.o"
    elsif os.windows? && os.host_cpu == "x86_32"
      system "cp other/win32/all.o o/lib/all.o"
    elsif os.windows? && os.host_cpu == "x86_64"
      system "cp other/win64/all.o o/lib/all.o"
    else
      die
    end
    system "make dep=false shell"
    bin.install "msh"
    #end
  end
end

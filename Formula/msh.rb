# require 'formula'

class Msh < Formula
  desc "The msh Interpreter as shell program."
  homepage "https://github.com/Max2github/mshgit"
  url "https://github.com/Max2github/mshgit/archive/refs/tags/shell.tar.gz"
  sha256 "4539ee486980b010e6945562d126ea50c27278d701c182cb91daed6b763b9920"
  license "MIT"
  version "1.0.1"
  #version "Shell program"

  # depends_on "cmake" => :build

  def install
    #mkdir 'build' do
    system "cp other/mac_x86_64/all.o o/lib/all.o"
    system "make dep=false shell"
    #system "make cleanshell"
    bin.install "msh"
    #end
  end
end

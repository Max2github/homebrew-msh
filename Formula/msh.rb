class msh < Formula
  desc "The msh Interpreter as shell program."
  homepage "https://github.com/Max2github/mshgit"
  url "https://github.com/Max2github/mshgit/archive/refs/tags/shell.tar.gz"
  #sha256 ""
  license "MIT"
  #version "1.0.1"

  # depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cp other/mac_arm/all.o o/lib/all.o"
      system "make dep=false shell"
    end
    bin.install "msh"
  end
end

# require 'formula'

class Msh < Formula
  desc "The msh Interpreter as shell program."
  homepage "https://github.com/Max2github/mshgit"
  url "https://github.com/Max2github/mshgit/archive/refs/tags/shell.tar.gz"
  sha256 "04c277dec15b4417a8311fc5bae238ffd900b4c4b32505df8efd1a63c13d18ec"
  license "MIT"
  version "1.0.1"
  #version "Shell program"

  # depends_on "cmake" => :build

  def install
    #binutils = Formula.factory "msh"

    #ENV['CC'] = '/usr/local/bin/gcc-4.9'
    #ENV['CXX'] = '/usr/local/bin/g++-4.9'
    #ENV['CPP'] = '/usr/local/bin/cpp-4.9'
    #ENV['LD'] = '/usr/local/bin/gcc-4.9'
    #ENV['PATH'] += ":#{binutils.prefix/"bin"}"

    mkdir "build" do
      system "ls"
      #system "cp other/mac_arm/all.o o/lib/all.o"
      #system "make dep=false shell"
      #bin.install "msh"
    end
  end
end

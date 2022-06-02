# require 'formula'
# require 'os'

$loc
$op
$myarch

class Msh < Formula
  desc "The msh Interpreter as shell program."
  homepage "https://github.com/Max2github/mshgit"
  url "https://github.com/Max2github/mshgit/archive/refs/tags/shell.tar.gz"
  sha256 "4539ee486980b010e6945562d126ea50c27278d701c182cb91daed6b763b9920"
  license "MIT"
  version "1.0.1"
  #version "Shell program"

  # depends_on "cmake" => :build
  #depends_on "gem" => :build

  def install
    puts RUBY_PLATFORM
    $loc = "mac_x86_64"
    puts "For the following you can skip it by giving incorrect input, or simply pressing enter"
    puts "Please choose which operating system you are on:"
    puts "MacOS (1)"
    puts "Linux (2)"
    $op = gets.chomp
    puts "Please choose which archetecture you have:"
    puts "x86 32-bit (1)"
    puts "x86 64-bit (2)"
    puts "arm / aarch 64-bit (3)"
    $myarch = gets.chomp
    if $op == "1" && $myarch == "2"
      $loc = "mac_x86_64"
    elsif $op == "1" && $myarch == "3"
      $loc = "mac_arm"
    elsif $op == "2" && $myarch == "1"
      $loc = "linux_x86_32"
    elsif $op == "2" && $myarch == "2"
      $loc = "linux_x86_64"
    elsif $op == "2" && $myarch == "3"
      $loc = "linux_arm"
    end
    puts "building for #{$loc}"
    puts "do you want to continue? (y/n)"
    $yesno = gets
    if $yesno == "n" || $yesno == "N"
      die
    end
=begin
    OS.host_cpu
    if OS.mac? && OS.host_cpu == "x86_64"
      system "cp other/mac_x86_64/all.o o/lib/all.o"
    elsif OS.mac? && OS.host_cpu == "arm64"
      system "cp other/mac_arm/all.o o/lib/all.o"
    elsif OS.linux? && OS.host_cpu == "arm64"
      system "cp other/linux_arm/all.o o/lib/all.o"
    elsif OS.linux? && OS.host_cpu == "x86_64"
      system "cp other/linux_x86_64/all.o o/lib/all.o"
    elsif OS.windows? && OS.host_cpu == "x86_32"
      system "cp other/win32/all.o o/lib/all.o"
    elsif OS.windows? && OS.host_cpu == "x86_64"
      system "cp other/win64/all.o o/lib/all.o"
    else
      die
    end
=end
    system "cp other/#{loc}/all.o o/lib/all.o"
    system "make dep=false shell"
    bin.install "msh"
    #end
  end
end

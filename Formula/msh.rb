# require 'formula'
# require 'os'

class Msh < Formula
  desc "The msh Interpreter as shell program."
  homepage "https://github.com/Max2github/mshgit"
  url "https://github.com/Max2github/mshgit/archive/refs/tags/shell.tar.gz"
  sha256 "e6a13af29f427a61e90a1be75f89d4e6f63dc0c91bf610e0148474440030f83e"
  license "MIT"
  version "1.0.1"
  #version "Shell program"

  # depends_on "cmake" => :build
  #depends_on "gem" => :build

  def install
    puts RUBY_PLATFORM
    loc = "mac_x86_64"
    host = "macos_x86_64"
    target = "macos_x86_64"
    puts "For the following you can skip it by giving incorrect input, or simply pressing enter"
    puts "Please choose which operating system you are on:"
    puts "MacOS (1)"
    puts "Linux (2)"
    op =  $stdin.gets.chomp
    puts "Please choose which archetecture you have:"
    puts "x86 32-bit (1)"
    puts "x86 64-bit (2)"
    #puts "arm / aarch 64-bit (3)"
    myarch = $stdin.gets.chomp
    if op == "1" && myarch == "2"
      loc = "mac_x86_64"
      host = "macos_x86_64"
    #elsif op == "1" && myarch == "3"
      #loc = "mac_arm"
      #host = "macos_arm"
    elsif op == "2" && myarch == "1"
      loc = "linux_x86_32"
      host = "linux_x86_32"
    elsif op == "2" && myarch == "2"
      loc = "linux_x86_64"
      host = "linux_x86_64"
    #elsif op == "2" && myarch == "3"
      #loc = "linux_arm"
      #name = "linux_arm"
    end
    
=begin
    puts "Please choose which operating system you want to build for:"
    puts "MacOS (1)"
    puts "Linux (2)"
    op =  $stdin.gets.chomp
    puts "Please choose which archetecture want to build for:"
    puts "x86 32-bit (1)"
    puts "x86 64-bit (2)"
    #puts "arm / aarch 64-bit (3)"
    myarch = $stdin.gets.chomp
    if op == "1" && myarch == "2"
      loc = "mac_x86_64"
      target = "macos_x86_64"
    #elsif op == "1" && myarch == "3"
      #loc = "mac_arm"
      #target = "macos_arm"
    elsif op == "2" && myarch == "1"
      loc = "linux_x86_32"
      target = "linux_x86_32"
    elsif op == "2" && myarch == "2"
      loc = "linux_x86_64"
      target = "linux_x86_64"
    #elsif op == "2" && myarch == "3"
      #loc = "linux_arm"
      #target = "linux_arm"
    end
=end
    puts "building for #{loc}"
=begin
    puts "do you want to continue? (y/n)"
    $yesno = gets
    if $yesno == "n" || $yesno == "N"
      die
    end
=end
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
    system "make dep=false host=#{host} target=#{target} shell"
    if target == host
      bin.install "msh"
    end
  end
end

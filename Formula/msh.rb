# require 'formula'
# require 'os'

class Msh < Formula
  desc "The msh Interpreter as shell program."
  homepage "https://github.com/Max2github/mshgit"
  url "https://github.com/Max2github/mshgit/archive/refs/tags/v3.tar.gz"
  sha256 "c7d58dab57dcf362d907c0c95058295f1038e6269ae4723c205bc29cf661f208"
  license "MIT"
  version "3.0.0"
  #version "Shell program version 3"

  #depends_on "make" => :build
  depends_on "git"
  #depends_on "gem" => :build

  def install
    puts Dir.getwd
    
    # move mshgit to msh
    #mv ".[^.]*", "msh"
    system "cp", "-R", "#{Dir.getwd}/", "msh/mshgit"
    
    # get lib
    system "mkdir lib && cd lib"
    system "git clone https://github.com/Max2github/lib.git"
    system "cd .."
    
    # get packages
    system "cd msh"
    system "git clone https://github.com/Max2github/msh-packages.git"
    
    system "cd", "mshgit"
    
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
      #loc = "mac_arm64"
      #host = "macos_arm64"
    elsif op == "2" && myarch == "1"
      loc = "linux_x86_i386"
      host = "linux_x86_i386"
    elsif op == "2" && myarch == "2"
      loc = "linux_x86_64"
      host = "linux_x86_64"
    #elsif op == "2" && myarch == "3"
      #loc = "linux_arm"
      #name = "linux_arm"
    end
  
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
    # copy correct all.o
    system "cp other/#{loc}/all.o o/lib/all.o"
    
    # launch devel
    system "make dep=false host=#{host} target=#{target} develop"
    system "./devel package ../msh-packages/std-essential"
    system "./devel package ../msh-packages/std-extended"
    system "./devel package ../msh-packages/IPsocket"
    
    # build msh
    system "make dep=false host=#{host} target=#{target} shell"
    if target == host
      bin.install "msh"
    end
  end
end

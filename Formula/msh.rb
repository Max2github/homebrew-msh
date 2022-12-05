# require 'formula'
# require 'os'
require 'fileutils'

class Msh < Formula
  desc "The msh Interpreter as shell program."
  homepage "https://github.com/Max2github/mshgit"
  url "https://github.com/Max2github/mshgit/archive/refs/tags/v3.tar.gz"
  sha256 "72ecee82dd0e0a1ed2e82127a8747ecc7e274c54340eb47b291d4beb27cbd915"
  license "MIT"
  version "3.0.0"
  #version "Shell program version 3"

  #depends_on "make" => :build
  #depends_on "git" => :build
  depends_on "wget" => :build
  #depends_on "gem" => :build
  
  def lsPrint
    puts Dir.glob("*")
  end
  
  def dirPrint
    puts Dir.pwd
  end
  
  def changeDir(dir)
    Dir.chdir(Dir.pwd + "/" + dir)
    #Dir.pwd = Dir.pwd+"/"+dir
    #system "cd #{dir}"
  end

  def install   
    root_dir = Dir.pwd
    
    # move mshgit to msh/mshgit
    #mshgit_dir = "msh/mshgit"
    #mkdir mshgit_dir
    #lsPrint()
    #system "find . ! -regex '.*/msh' ! -regex '.' -exec cp -r '{}' msh \\;"
    #system "find . ! -regex '.*/msh' ! -regex '.' -exec rm -r '{}' \\;"
    #changeDir("msh")
    #Dir.chdir(Dir.pwd+"/"+"msh")
    #mkdir "mshgit"
    #system "find . ! -regex '.*/mshgit' ! -regex '.' -exec cp -r '{}' mshgit \\;"
    #system "find . ! -regex '.*/mshgit' ! -regex '.' -exec rm -r '{}' \\;"
    #changeDir("..")
    #Dir.chdir(Dir.pwd+"/"+"..")
    
=begin
    FileUtils.mv("develop", mshgit_dir)
    FileUtils.mv("Makefile", mshgit_dir)
    FileUtils.mv("include", mshgit_dir)
    FileUtils.mv("other", mshgit_dir)
    FileUtils.mv("dependencies", mshgit_dir)
    FileUtils.mv("o", mshgit_dir)
    FileUtils.mv("README.md", mshgit_dir)
    FileUtils.mv("shell.c", mshgit_dir)
    FileUtils.mv("project", mshgit_dir)
    FileUtils.mv("build", mshgit_dir)
    FileUtils.mv("src", mshgit_dir)
=end
    #system "setopt extendedglob"
    #system "mv * msh/mshgit"
    #FileUtils.mv(Dir.glob("*"), "msh/mshgit")
    #system "shopt -s extglob"
    #system "mv !(msh) msh/mshgit"
    #system "/usr/local/opt/coreutils/libexec/gnubin/mv !(msh) msh/mshgit"
    #system "ls | grep -v msh/mshgit | xargs -I '{}' mv {} msh/mshgit"
    
    # get lib
    #system "git clone https://github.com/Max2github/lib.git"
    
    # get packages
    #changeDir("msh")
    #changeDir(mshgit_dir)
    
    #msh_dir = Dir.pwd
    #Dir.chdir(Dir.pwd+"/"+"msh")
    #system "git clone https://github.com/Max2github/msh-packages.git"
    
    #changeDir("mshgit")
    #Dir.chdir(Dir.pwd+"/"+"mshgit")
    
    #dirPrint()
    
    puts RUBY_PLATFORM
    
    loc = "mac_x86_64"
    host = "macos_x86_64"
    target = "macos_x86_64"
    exe = "macos_x86_64"
    
    puts "For the following you can skip it by giving incorrect input, or simply pressing enter"
    puts "Please choose which operating system you are on:"
    puts "MacOS (1)"
    puts "Linux (2)"
    op =  $stdin.gets.chomp
    
    puts "Please choose which archetecture you have:"
    puts "x86 32-bit (1)"
    puts "x86 64-bit (2)"
    puts "arm / aarch 64-bit (3)"
    myarch = $stdin.gets.chomp
    
    if op == "1" && myarch == "2"
      loc = "mac_x86_64"
      exe = "msh_macos_x86_64"
      host = "macos_x86_64"
    elsif op == "1" && myarch == "3"
      loc = "mac_arm64"
      exe = "msh_macos_arm64"
      host = "macos_arm64"
    elsif op == "2" && myarch == "1"
      loc = "linux_i386"
      exe = "msh_linux_i386"
      host = "linux_i386"
    elsif op == "2" && myarch == "2"
      loc = "linux_x86_64"
      exe = "msh_linux_x86_64"
      host = "linux_x86_64"
    elsif op == "2" && myarch == "3"
      loc = "linux_arm64"
      exe = "msh_linux_arm64"
      host = "linux_arm64"
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
    #system "cp other/#{loc}/all.o o/lib/all.o"
    
    # make devel
    #system "make dep=false host=#{host} target=#{target} develop"
    
    # launch devel
    #Dir.chdir(msh_dir)
    #system "./mshgit/devel package msh-packages/std-essential"
    #lsPrint()
    #system "make command action=package data=msh-packages/std-essential"
    #system "./devel package msh-packages/std-essential"
    #system "./devel package ../msh-packages/std-extended"
    #system "./devel package ../msh-packages/IPsocket"
    
    # build msh
    #system "make dep=false host=#{host} target=#{target} shell"
    
    # for now we won't build it, because devel does not seem to work her (segmentation fault)
    # so we just get the correct binary -> nearly all steps before are not necessary anymore
    system "wget", "https://github.com/Max2github/mshgit/releases/download/v3/#{exe}"
    FileUtils.mv("#{exe}", "msh")
    lsPrint()
    
    if target == host
      puts "Installing..."
      bin.install "msh"
    end
  end
end

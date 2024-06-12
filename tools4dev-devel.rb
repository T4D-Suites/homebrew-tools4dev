  class Tools4devDevel < Formula
    desc "UNIX zsh Library (shell as functions)"
    homepage "https://github.com/T4D-Suites/Tools4Dev"
    version "7.2.0-dev27"
    url "https://github.com/T4D-Suites/Tools4Dev/releases/download/#{version}/tools4dev_#{version}.tar"
    sha256 "09cbab34cd40a1b03a5d41eb0406e955232e84d50806e79587658d19cc43f135"
    license "MIT-Modern-Variant"
  
    depends_on "zsh"
    depends_on "jq" => :recommended
    depends_on "awscli" => :optional
  
    # on_system macos: do
      depends_on "coreutils"
    # end
  
    def install
      # ENV.deparallelize  # if your formula fails when building in parallel
      # Remove unrecognized options if warned by configure
      # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
      system "./src/Platforms/brew-install.sh", "--prefix=#{prefix} --suffix dev"
      system "mkdir -p #{bin}"
      system "git clone git@github.com:T4D-Suites/homebrew-tools4dev.git"
      system "mv homebrew-tools4dev/t4d-devel #{bin}"
    end
  
    test do
      assert_equal "tools4dev", shell_output("#{bin}/t4d 'echo tools4dev'").chomp
    end
  end
  


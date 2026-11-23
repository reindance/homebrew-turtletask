class TurtletaskCli < Formula
  desc "TurtleTask from the terminal: what needs you, add work, decide on it"
  homepage "https://turtletask.app/"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/reindance/homebrew-turtletask/releases/download/cli-v#{version}/tt-#{version}-darwin-arm64.tar.gz"
      sha256 "0710de791eeab4057e858edca4f4eff8dbb467b08fab90e891e04dbeba3be455"
    end
    on_intel do
      url "https://github.com/reindance/homebrew-turtletask/releases/download/cli-v#{version}/tt-#{version}-darwin-x64.tar.gz"
      sha256 "33ca617b471177e25666293243547c3f77214f1f5c4001fcb35cdcc3aaa3f36d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/reindance/homebrew-turtletask/releases/download/cli-v#{version}/tt-#{version}-linux-arm64.tar.gz"
      sha256 "452e50bcb38c8d86e4e99559c3e710c3daa82d3ea21fec203e0716e8853c1ab6"
    end
    on_intel do
      url "https://github.com/reindance/homebrew-turtletask/releases/download/cli-v#{version}/tt-#{version}-linux-x64.tar.gz"
      sha256 "e6e49000858bd0d5612942539e929382c9cb45e4fe92bcd64bc672ddd936d21d"
    end
  end

  def install
    bin.install "tt"
    generate_completions_from_executable(bin/"tt", "completion")
  end

  test do
    assert_equal version.to_s, shell_output("TT_NO_UPDATE_CHECK=1 #{bin}/tt --version").strip
    assert_match "Not signed in", shell_output("TT_CONFIG_DIR=#{testpath} #{bin}/tt whoami 2>&1", 3)
  end
end

class TurtletaskCli < Formula
  desc "TurtleTask from the terminal: what needs you, add work, decide on it"
  homepage "https://turtletask.app/"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/reindance/homebrew-turtletask/releases/download/cli-v#{version}/tt-#{version}-darwin-arm64.tar.gz"
      sha256 "0bcb1e82bab696f282edab01343dd2f1076daeb878518a33d4427e58bc196b68"
    end
    on_intel do
      url "https://github.com/reindance/homebrew-turtletask/releases/download/cli-v#{version}/tt-#{version}-darwin-x64.tar.gz"
      sha256 "4d57e171287db8ece9769912ad2818c72aab45fbac7a84516fdb2a8b356d62aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/reindance/homebrew-turtletask/releases/download/cli-v#{version}/tt-#{version}-linux-arm64.tar.gz"
      sha256 "8b2a08863ec7ffea115331252dbc763d214f1b6fc505e84f6546d294355287a2"
    end
    on_intel do
      url "https://github.com/reindance/homebrew-turtletask/releases/download/cli-v#{version}/tt-#{version}-linux-x64.tar.gz"
      sha256 "4eb29953e3db7051c02e7bd37b714dc60181c8458f603bf776e70d240a11d1a7"
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

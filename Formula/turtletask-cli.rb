class TurtletaskCli < Formula
  desc "TurtleTask from the terminal: what needs you, add work, decide on it"
  homepage "https://turtletask.app/"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/reindance/homebrew-turtletask/releases/download/cli-v#{version}/tt-#{version}-darwin-arm64.tar.gz"
      sha256 "2fbe847f78c20fdb06114b778f83418ab255121722148390804669846444a4b9"
    end
    on_intel do
      url "https://github.com/reindance/homebrew-turtletask/releases/download/cli-v#{version}/tt-#{version}-darwin-x64.tar.gz"
      sha256 "4911e6e6649967f025e1d020dcc3bd59f136842565f38815b1f80188f594203e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/reindance/homebrew-turtletask/releases/download/cli-v#{version}/tt-#{version}-linux-arm64.tar.gz"
      sha256 "4f863e483ae8e92ff8c35ff6f6ff857bda2ff1e56d5c6d2ab108f81d52f443bf"
    end
    on_intel do
      url "https://github.com/reindance/homebrew-turtletask/releases/download/cli-v#{version}/tt-#{version}-linux-x64.tar.gz"
      sha256 "123401659362021c69909fac557ecdaf335a5061a1c13d1089dfa01cf160b209"
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

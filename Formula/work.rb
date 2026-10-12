class Work < Formula
  desc "Smarter cd for git worktrees, where the branch is the address"
  homepage "https://github.com/JHK/work"
  url "https://github.com/JHK/work/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "af96e0df71f1336897d92f9bbd99991c61d00f6e2bfd4efb35b641197d94e286"
  license "MIT"

  depends_on "go" => :build
  depends_on "git"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=v#{version}"), "./cmd/work"
  end

  test do
    assert_match "work version v#{version} ", shell_output("#{bin}/work --version")
  end
end

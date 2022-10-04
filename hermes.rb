# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Hermes < Formula
  desc "IBC Relayer in Rust"
  homepage "https://hermes.informal.systems"
  url "https://github.com/informalsystems/hermes/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "742b19895aa76194580bac08b82147b59c06f2dc807b7e343797078d75213e71"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./crates/relayer-cli"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test hermes`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/hermes", "version"
  end
end

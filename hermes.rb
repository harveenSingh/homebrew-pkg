class Hermes < Formula
  desc "IBC Relayer in Rust"
  homepage "https://hermes.informal.systems"
  url "https://github.com/informalsystems/hermes/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "742b19895aa76194580bac08b82147b59c06f2dc807b7e343797078d75213e71"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./crates/relayer-cli"
  end

  test do
    system "#{bin}/hermes", "version"
  end
end

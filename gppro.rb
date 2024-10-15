class Gppro < Formula
  desc "Manage applets and keys on Java Cards"
  homepage "https://github.com/martinpaljak/GlobalPlatformPro"

  version "24.10.15"

  url "https://github.com/martinpaljak/GlobalPlatformPro/releases/download/v24.10.15/gp.jar"
  sha256 "a68eca9ab9be84a0560b2d312ca6a18cd2dbcd223bb7b30525e0e0f85a372696"

  head "https://github.com/martinpaljak/GlobalPlatformPro.git", branch: "master"

  depends_on "maven" => :build
  depends_on "openjdk@17"

  def install
    if build.head?
      system Formula["maven"].bin/"mvn", "package"
      prefix.install "tool/target/gp.jar"
    else
      prefix.install "gp.jar"
    end
    bin.write_jar_script prefix/"gp.jar", "gp"
  end
end

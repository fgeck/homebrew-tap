cask "zmk-hud" do
  version "0.0.1"
  sha256 "9fe11759ce31692dac31954528b8ed958cbc15ce3c0524f16490474ba8d84ff3"

  url "https://github.com/fgeck/zmk-hud/releases/download/v#{version}/zmk-hud.zip",
      verified: "github.com/fgeck/zmk-hud"
  name "ZMK HUD"
  desc "Floating HUD display for ZMK keyboards showing active layer and key presses"
  homepage "https://github.com/fgeck/zmk-hud"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "ZMKHud.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/ZMKHud.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.fgeck.zmk-hud",
    "~/Library/Caches/com.fgeck.zmk-hud",
    "~/Library/Preferences/com.fgeck.zmk-hud.plist",
  ]
end

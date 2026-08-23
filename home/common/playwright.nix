{pkgs, ...}: let
  browsers =
    (builtins.fromJSON
      (builtins.readFile "${pkgs.playwright-driver}/browsers.json"))
    .browsers;

  chromium-rev =
    (builtins.head
      (builtins.filter (x: x.name == "chromium") browsers))
    .revision;

  chromium = "${pkgs.playwright-driver.browsers}/chromium-${chromium-rev}/chrome-linux64/chrome";
in {
  home.packages = with pkgs; [
    bun
    playwright-driver.browsers
    nspr
  ];

  home.sessionVariables = {
    PLAYWRIGHT_LAUNCH_OPTIONS_EXECUTABLE_PATH = chromium;
    PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS = "true";
    PLAYWRIGHT_HOST_PLATFORM_OVERRIDE = "ubuntu-24.04";
  };
}

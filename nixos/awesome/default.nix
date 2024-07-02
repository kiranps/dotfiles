{ config, pkgs, ... }:
let link = config.lib.file.mkOutOfStoreSymlink;
in {
  home.file = {
    ".config/awesome/rc.lua".source = link ./rc.lua;
    ".config/awesome/layouts.lua".source = link ./layouts.lua;
    ".config/awesome/signals.lua".source = link ./signals.lua;
    ".config/awesome/keys.lua".source = link ./keys.lua;
    ".config/awesome/rules.lua".source = link ./rules.lua;
    ".config/awesome/wibox.lua".source = link ./wibox.lua;
    ".config/awesome/theme.lua".source = link ./theme.lua;
    ".config/awesome/constants.lua".source = link ./constants.lua;
    ".config/awesome/startup.lua".source = link ./startup.lua;
  };
}

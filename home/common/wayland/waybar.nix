{config, ...}: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "bottom";
        position = "top";
        height = 20;
        spacing = 0;
        modules-left = [
          "sway/workspaces"
          "sway/mode"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "memory"
          "tray"
          "pulseaudio"
          "network"
          "bluetooth"
          "backlight"
          "battery"
        ];
        "keyboard-state" = {
          numlock = true;
          capslock = true;
          format = "{name} {icon}";
          format-icons = {
            locked = "";
            unlocked = "";
          };
        };
        "sway/mode" = {
          format = "<span style=\"italic\">{}</span>";
        };
        "sway/workspaces" = {
          on-click = "activate";
          sort-by-number = true;
        };
        "sway/scratchpad" = {
          format = "{icon} {count}";
          show-empty = false;
          format-icons = [
            ""
            ""
          ];
          tooltip = true;
          tooltip-format = "{app}: {title}";
        };
        "sway/window" = {
          max-length = 30;
        };
        "bluetooth" = {
          format = "{status}  ";
          format-disabled = "";
          format-connected = "{num_connections}  ";
          tooltip-format = "{controller_alias}\t{controller_address}";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
        };
        "tray" = {
          icon-size = 13;
          spacing = 20;
        };
        "clock" = {
          interval = 60;
          tooltip = false;
          format = "{:%I:%M %p | %A, %d/%m/%y}";
        };
        "cpu" = {
          format = "{usage}% ";
          tooltip = false;
        };
         "memory" = {
           format = "{swapUsed:0.1f}G/{swapTotal:0.1f}G    {used:0.1f}G/{total:0.1f}G  ";
           warning-threshold = 80;
           critical-threshold = 90;
         };
        "temperature" = {
          critical-threshold = 80;
          format-critical = "{temperatureC}°C {icon}";
          format = "{temperatureC}°C {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
          ];
        };
        "backlight" = {
          device = "acpi_video0";
          format = "{percent}% {icon} ";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };
        "battery" = {
          states = {
            critical = 10;
            warning = 20;
            good = 90;
            full = 100;
            over = 101;
          };
          interval = 30;
          format = "{capacity}% {icon} ";
          format-charging = "{capacity}% {icon}   charging ";
          format-plugged = "{capacity}% {icon}   ";
          format-alt = "{time} {icon} ";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
        "network" = {
          format-wifi = "{essid} {signalStrength}% ";
          format-ethernet = "{essid} {signalStrength}%  ";
          tooltip-format = "{ifname} via {gwaddr}  ";
          format-linked = "{ifname} (no ip) ";
          format-disconnected = "OFF ";
          format-alt = "{ifname} = {ipaddr}/{cidr} ";
          interval = 30;
        };
        "pulseaudio" = {
          format = "  {volume}%  {icon} {format_source}";
          format-muted = " {volume}%  {icon} {format_source}";
          format-bluetooth = "  {volume}%    {icon} {format_source}";
          format-bluetooth-muted = " {volume}%    {icon} {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "{volume}% ";
          format-icons = {
            headphone = "  ";
            headset = "  ";
            hands-free = "  ";
            earbuds = "  ";
            speakers = "🔊  ";
            phone = "";
            portable = "";
            car = "";
            hdmi = "";
            default = [
              ""
              ""
              ""
            ];
          };
        };
      };
    };
    style = ''
            @keyframes blink-warning {
                70% {
                    color: white;
                }

                to {
                    color: white;
                    background-color: orange;
                }
            }

            @keyframes blink-critical {
                70% {
                  color: white;
                }

                to {
                    color: white;
                    background-color: red;
                }
            }


            /* -----------------------------------------------------------------------------
             * Base styles
             * -------------------------------------------------------------------------- */

            /* Reset all styles */
            * {
                border: none;
                border-radius: 0;
                min-height: 0;
                margin: 0;
                padding: 0;
            }

            /* The whole bar */
            #waybar {
                background: #323232;
                background-color: rgba(43, 48, 59, 0.5);
                color: white;
                font-family: iosevka, monospace;
                font-size: 10px;
            }

            /* Each module */
            #battery,
            #clock,
            #cpu,
            #custom-keyboard-layout,
            #memory,
      #custom-swap,
            #bluetooth,
            #mode,
            #network,
            #pulseaudio,
            #temperature,
            #tray {
                padding-left: 8px;
                padding-right: 8px;
            }


            /* -----------------------------------------------------------------------------
             * Module styles
             * -------------------------------------------------------------------------- */

            #battery {
                animation-timing-function: linear;
                animation-iteration-count: infinite;
                animation-direction: alternate;
            }

            #battery.warning {
                color: orange;
            }

            #battery.critical {
                color: red;
            }

            #battery.warning.discharging {
                animation-name: blink-warning;
                animation-duration: 3s;
            }

            #battery.critical.discharging {
                animation-name: blink-critical;
                animation-duration: 2s;
            }

            #clock {
            }

            #cpu {
            }

            #cpu.warning {
                color: orange;
            }

            #cpu.critical {
                color: red;
            }

            #memory {
                animation-timing-function: linear;
                animation-iteration-count: infinite;
                animation-direction: alternate;
            }

            #memory.warning {
                color: orange;
            }

            #memory.critical {
                color: red;
                animation-name: blink-critical;
                animation-duration: 2s;
            }

            #mode {
                background: #64727D;
                border-top: 2px solid white;
                /* To compensate for the top border and still have vertical centering */
                padding-bottom: 2px;
            }

            #network {
            }

            #network.disconnected {
                color: orange;
            }

            #pulseaudio {
            }

            #pulseaudio.muted {
            }

            #custom-spotify {
                color: rgb(102, 220, 105);
            }

            #temperature {
            }

            #temperature.critical {
                color: red;
            }

            #tray {
            }

            #window {
                font-weight: bold;
            }

            #workspaces button {
                border-top: 2px solid transparent;
                /* To compensate for the top border and still have vertical centering */
                padding-top: 2px;
                padding-left: 5px;
                padding-right: 5px;
                color: #888888;
            }

            #workspaces button.focused {
                border-color: #4c7899;
                color: white;
                background-color: #285577;
            }

            #workspaces button.urgent {
                border-color: #c9545d;
                color: #c9545d;
            }
    '';
  };
}

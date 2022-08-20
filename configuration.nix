{ config, pkgs, ... }:

# Install home manager
let
    home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
    imports = [
        (import "${home-manager}/nixos")
    ];

    home-manager = {
        users = {
            icedborn = {
                programs = {
                    git = {
                        enable = true;
                        # Git config
                        userName  = "IceDBorn";
                        userEmail = "github.envenomed@dralias.com";
                    };

                    alacritty = {
                        enable = true;
                        # Alacritty config
                        settings = {
                            window = {
                                decorations = "none";
                                opacity = 0.8;
                            };

                            cursor.style = {
                                shape = "Underline";
                                blinking = "Always";
                            };
                        };
                    };

                    mangohud = {
                        enable = true;
                        # MangoHud is started on any application that supports it
                        enableSessionWide = true;
                        # Mangohud config
                        settings = {
                            background_alpha = 0;
                            cpu_color = "FFFFFF";
                            engine_color = "FFFFFF";
                            font_size = 20;
                            fps_limit = "144+60+0";
                            frame_timing = 0;
                            gl_vsync = 0;
                            gpu_color = "FFFFFF";
                            offset_x = 50;
                            position = "top-right";
                            toggle_fps_limit = "F1";
                            vsync= 1;
                            cpu_temp = "";
                            fps = "";
                            gamemode = "";
                            gpu_temp = "";
                            no_small_font = "";
                        };
                    };

                    zsh = {
                        enable = true;
                        # Enable firefox wayland
                        profileExtra = "export MOZ_ENABLE_WAYLAND=1";
                    };

                    dconf.settings = {
                        # Nautilus path bar is always editable
                        "org/gnome/nautilus/preferences" = {
                            always-use-location-entry = true;
                        };

                        # Enable fractional scaling
                        "org/gnome/mutter" = {
                            experimental-features = [ "scale-monitor-framebuffer" ];
                        };

                        # Enable gnome extensions
                        "org/gnome/shell" = {
                            disable-user-extensions = false;
                        };

                        # Set enabled gnome extensions
                        "org/gnome/shell" = {
                            enabled-extensions = [  "clipboard-indicator@tudmotu.com"
                                                    "material-shell@papyelgringo"
                                                    "gsconnect@andyholmes.github.io"
                                                    "trayIconsReloaded@selfmade.pl"
                                                    "sound-output-device-chooser@kgshank.net"
                                                    "bluetooth-quick-connect@bjarosze.gmail.com"
                                                    "color-picker@tuberry"
                                                    "gamemode@christian.kellner.me"
                                                    "CoverflowAltTab@dmo60.de"
                                                    "volume-mixer@evermiss.net"
                                                  ];
                        };

                        # Enable dark mode
                        "org/gnome/desktop/interface" = {
                            color-scheme = "prefer-dark";
                        };

                        # Change icon theme
                        "org/gnome/desktop/interface" = {
                            icon-theme = "Tela-black-dark";
                        };

                        # Change gtk theme
                        "org/gnome/desktop/interface" = {
                            gtk-theme = "Plata-Noir-Compact";
                        };
                    };

                    # Add desktop file for 4 terminals
                    xdg.desktopEntries = {
                        startup-terminals = {
                            type = "Application";
                            exec = "bash -c 'alacritty & alacritty & alacritty & alacritty'";
                            icon = "Alacritty";
                            terminal = "false";
                            categories = "System;TerminalEmulator;";
                            name = "Startup Terminals";
                            genericName = "Terminal";
                            comment = "A fast, cross-platform, OpenGL terminal emulator";
                            actions = "New;";
                        };
                    };

                    home.file = {
                        # Add zsh theme to zsh directory
                        ".config/zsh/zsh-theme.sh" = {
                            source = ./scripts/zsh-theme.sh;
                            recursive = true;
                        };

                        # Add protondown script to zsh directory
                        ".config/zsh/protondown.sh" = {
                            source = ./scripts/protondown.sh;
                            recursive = true;
                        };

                        # Add nvidia fan control wayland to zsh directory
                        ".config/zsh/nvidia-fan-control-wayland.sh" = {
                            source = ./scripts/nvidia-fan-control-wayland.sh;
                            recursive = true;
                        };

                        # Add nvidia power limit control
                        ".config/nvidia-power-limit/nv-power-limit.sh" = {
                            source = ./scripts/nv-power-limit.sh;
                            recursive = true;
                        };

                        # Add firefox privacy profile
                        ".mozilla/firefox/privacy/user-overrides.js" = {
                            source = ./scripts/user-overrides.js;
                            recursive = true;
                        };

                        # Add noise suppression microphone
                        ".config/pipewire/pipewire.conf" = {
                            source = ./configs/pipewire.conf;
                            recursive = true;
                        };
                    };
                };
            };

            work = {
                programs = {
                    git = {
                        enable = true;
                        # Git config
                        userName  = "IceDBorn";
                        userEmail = "github.envenomed@dralias.com";
                    };

                    alacritty = {
                        enable = true;
                        # Alacritty config
                        settings = {
                            window = {
                                decorations = "none";
                                opacity = 0.8;
                            };

                            cursor.style = {
                                shape = "Underline";
                                blinking = "Always";
                            };
                        };
                    };

                    zsh = {
                        enable = true;
                        # Enable firefox wayland
                        profileExtra = "export MOZ_ENABLE_WAYLAND=1";
                    };

                    dconf.settings = {
                        # Nautilus path bar is always editable
                        "org/gnome/nautilus/preferences" = {
                            always-use-location-entry = true;
                        };

                        # Enable fractional scaling
                        "org/gnome/mutter" = {
                            experimental-features = [ "scale-monitor-framebuffer" ];
                        };

                        # Enable gnome extensions
                        "org/gnome/shell" = {
                            disable-user-extensions = false;
                        };

                        # Set enabled gnome extensions
                        "org/gnome/shell" = {
                            enabled-extensions = [
                                "clipboard-indicator@tudmotu.com"
                                "material-shell@papyelgringo"
                                "gsconnect@andyholmes.github.io"
                                "trayIconsReloaded@selfmade.pl"
                                "sound-output-device-chooser@kgshank.net"
                                "bluetooth-quick-connect@bjarosze.gmail.com"
                                "color-picker@tuberry"
                                "gamemode@christian.kellner.me"
                                "CoverflowAltTab@dmo60.de"
                                "volume-mixer@evermiss.net"
                            ];
                        };

                        # Enable dark mode
                        "org/gnome/desktop/interface" = {
                            color-scheme = "prefer-dark";
                        };

                        # Change icon theme
                        "org/gnome/desktop/interface" = {
                            icon-theme = "Tela-black-dark";
                        };

                        # Change gtk theme
                        "org/gnome/desktop/interface" = {
                            gtk-theme = "Plata-Noir-Compact";
                        };
                    };

                    # Add desktop file for 4 terminals
                    xdg.desktopEntries = {
                        startup-terminals = {
                            type = "Application";
                            exec = "bash -c 'alacritty & alacritty & alacritty & alacritty'";
                            icon = "Alacritty";
                            terminal = "false";
                            categories = "System;TerminalEmulator;";
                            name = "Startup Terminals";
                            genericName = "Terminal";
                            comment = "A fast, cross-platform, OpenGL terminal emulator";
                            actions = "New;";
                        };
                    };

                    home.file = {
                        # Add zsh theme to zsh directory
                        ".config/zsh" = {
                            source = ./scripts/zsh-theme.sh;
                            recursive = true;
                        };

                        # Add protondown script to zsh directory
                        ".config/zsh" = {
                            source = ./scripts/protondown.sh;
                            recursive = true;
                        };

                        # Add nvidia fan control wayland to zsh directory
                        ".config/zsh" = {
                            source = ./scripts/nvidia-fan-control-wayland.sh;
                            recursive = true;
                        };

                        # Add nvidia power limit control
                        ".config/nvidia-power-limit" = {
                            source = ./scripts/nv-power-limit.sh;
                            recursive = true;
                        };

                        # Add firefox privacy profile
                        ".mozilla/firefox/privacy/updater.sh" = {
                            source = ./configs/user-overrides.js;
                            recursive = true;
                        };

                        # Add noise suppression microphone
                        ".config/pipewire" = {
                            source = ./configs/pipewire.conf;
                            recursive = true;
                        };
                    };
                };
            };
        };
    };
}

{
    imports =
    [
        # Include the results of the hardware scan, generate yours with "nixos-generate-config"
        ./hardware-configuration.nix
    ];

    # Grub configuration
    boot = {
        loader = {
            systemd-boot.enable = true;
            efi = {
                canTouchEfiVariables = true;
                efiSysMountPoint = "/boot/efi";
            };
            # Detect all operating systems
            grub.useOSProber = true;
        };
        # Use Zen kernel
        kernelPackages = pkgs.linuxPackages_zen;
        # Virtual camera for OBS
        kernelModules = [ "v4l2loopback" "xpadneo" ];
    };

    networking = {
        # Define your hostname
        hostName = "icedborn";
        # Enable networking
        networkmanager.enable = true;
        # Disable firewall
        firewall.enable = false;
    };

    # Set your time zone
    time.timeZone = "Europe/Bucharest";

    # Set your locale settings
    i18n = {
        defaultLocale = "en_US.utf8";
        extraLocaleSettings = {
            LC_MEASUREMENT = "es_ES.utf8";
        };
    };

    services = {
        xserver = {
            # Enable the X11 windowing system
            enable = true;
            # Enable the GNOME Desktop Environment
            displayManager.gdm.enable = true;
            desktopManager.gnome.enable = true;
            # Configure keymap in X11
            layout = "us";
            xkbVariant = "";
            videoDrivers = [ "nvidia" ];
        };

        # Enable CUPS to print documents
        printing.enable = true;

        # Enable sound with pipewire
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
        };

        # Enable SSH
        openssh.enable = true;

        gnome = {
            chrome-gnome-shell.enable = true; # Allows to install GNOME Shell extensions from a web browser
            sushi.enable = true; # Quick previewer for nautilus
        };
    };

    sound.enable = true;

    security = {
        # Required by RPCS3
        pam.loginLimits = [
            {
                domain = "*";
                type = "hard";
                item = "memlock";
                value = "2147483648";
            }

            {
                domain = "*";
                type = "soft";
                item = "memlock";
                value = "2147483648";
            }
        ];

        # Enable the RealtimeKit system service, which hands out realtime scheduling priority to user processes on demand
        rtkit.enable = true;

        # Show asterisks when typing sudo password
        sudo.extraConfig = "Defaults pwfeedback";
    };

    hardware = {
        # Disable pulseaudio
        pulseaudio.enable = false;
        opengl = {
            enable = true;
            # Support Direct Rendering for 32-bit applications (such as Wine) on 64-bit systems
            driSupport32Bit = true;
        };
        # Enable kernel modesetting when using the NVIDIA driver, needed for gnome wayland
        nvidia.modesetting.enable = true;
    };

    users = {
        # Set default shell to zsh
        defaultUserShell = pkgs.zsh;

        # Define users below
        users = {
            icedborn = {
                createHome = true;
                home = "/home/icedborn";
                useDefaultShell = true;
                # Default password used for first login, change later with passwd
                password = "1";
                isNormalUser = true;
                description = "IceDBorn";
                extraGroups = [ "networkmanager" "wheel" ];
                # Packages installed for this specific user only
                packages = with pkgs; [
                    android-studio # IDE for Android apps
                    bottles # Wine prefix manager
                    duckstation # PS1 Emulator
                    gamemode # Optimizations for gaming
                    godot # Game engine
                    heroic # Epic Games Launcher for Linux
                    mangohud # A metric overlay
                    pcsx2 # PS2 Emulator
                    ppsspp # PSP Emulator
                    protontricks # Winetricks for proton prefixes
                    rpcs3 # PS3 Emulator
                    ryujinx # Switch Emulator
                    scanmem # Cheat engine for linux
                    steam # Gaming platform
                ];
            };

            work = {
                createHome = true;
                home = "/home/work";
                useDefaultShell = true;
                # Default password used for first login, change later with passwd
                password = "1";
                isNormalUser = true;
                description = "Work";
                extraGroups = [ "networkmanager" "wheel" ];
                # Packages installed for this specific user only
                packages = with pkgs; [
                    # Add work specific packages here
                ];
            };
        };
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Packages installed system-wide
    environment.systemPackages = with pkgs; [
        alacritty # Terminal
        android-tools # Tools for debugging android devices
        aria # Terminal downloader with multiple connections support
        firefox-bin # Browser
        fragments # Bittorrent client following Gnome UI standards
        gimp # Image editor
        git # Distributed version control system
        gnome.gnome-tweaks # Tweaks missing from pure Gnome
        gnomeExtensions.application-volume-mixer # Application volume mixer on the gnome control center
        gnomeExtensions.bluetooth-quick-connect # Show bluetooth devices on the gnome control center
        gnomeExtensions.clipboard-indicator # Clipboard indicator for gnome
        gnomeExtensions.color-picker # Color picker for gnome
        gnomeExtensions.coverflow-alt-tab # Makes alt tab on gnome cooler
        gnomeExtensions.gamemode # Status indicator for gamemode on gnome
        gnomeExtensions.gsconnect # KDE Connect implementation for gnome
        gnomeExtensions.material-shell # Tiling WM for gnome
        gnomeExtensions.sound-output-device-chooser # Sound devices choose on the gnome control center
        gnomeExtensions.tray-icons-reloaded # Tray icons for gnome
        helvum # Pipewire patchbay
        jetbrains.webstorm # All purpose IDE
        mullvad-vpn # VPN Client
        nautilus-open-any-terminal # Open any terminal from nautilus context menu
        ntfs3g # Support NTFS drives
        obs-studio # Recording/Livestream
        onlyoffice-bin # Microsoft Office alternative for Linux
        pitivi # Video editor
        plata-theme # Gnome theme
        ranger # Terminal file manager
        rnnoise-plugin # A real-time noise suppression plugin
        signal-desktop # Encrypted messaging platform
        sublime4 # Text editor
        syncthing # Local file sync
        tela-icon-theme # Icon theme
        tree # Display folder content at a tree format
        unrar # Support opening rar files
        usbimager # ISO Burner
        wget # Terminal downloader
        wine # Compatibility layer capable of running Windows applications
        winetricks # Wine prefix settings manager
        woeusb # Windows ISO Burner
        zenstates # Ryzen CPU controller
    ];

    programs = {
        # Enable zsh and configure it
        zsh = {
            enable = true;
            # Enable oh my zsh and it's plugins
            ohMyZsh = {
                enable = true;
                plugins = [ "git" "npm" "nvm" "sudo" "systemd" ];
            };
            # Enable auto suggestions
            autosuggestions.enable = true;

            # Enable syntax highlighting
            syntaxHighlighting.enable = true;

            # Aliases
            shellAliases = {
                aria2c="aria2c -j 16 -s 16"; # Download with aria using best settings
                chmod="sudo chmod"; # It's a command that I always execute with sudo
                clear-keys="sudo rm -rf ~/ local/share/keyrings/* ~/ local/share/kwalletd/*"; # Clear system keys
                clear-proton-ge="bash ~/.config/zsh/protondown.sh"; # Download the latest proton ge version and delete the older ones
                nvidia-max-fan-speed="sudo bash ~/.config/zsh/nvidia-fan-control-wayland.sh 100"; # Maximize nvidia fan speed on wayland
                reboot-windows="(sudo grub-set-default 0) && (sudo grub-reboot 2) && (sudo reboot)"; # Reboot to windows once
                restart-pipewire="systemctl --user restart pipewire"; # Restart pipewire
                ssh="TERM=xterm-256color ssh"; # SSH with colors
                update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"; # Update grub with new entries
                update="(sudo nixos-rebuild switch --upgrade) ; (yes | protonup) ; (yes | ~/.mozilla/firefox/privacy/updater.sh)"; # Update everything
                vpn-off="mullvad disconnect"; # Disconnect from VPN
                vpn-on="mullvad connect"; # Connect to VPN
                vpn="mullvad status"; # Show VPN status
            };

            # Commands to run on zsh shell initialization
            interactiveShellInit = "source ~/.config/zsh/zsh-theme.sh\nunsetopt PROMPT_SP";
        };

        # Add dconf
        dconf.enable = true;
    };


    systemd.services = {
        # Ryzen 5 3600 clock (4200) voltage (1.25)
        zenstates = {
            enable = true;
            description = "Ryzen Undervolt";
            after = [ "syslog.target" "systemd-modules-load.service" ];
            unitConfig = {
                conditionPathExists = "{zenstates}/bin/zenstates";
            };
            serviceConfig = {
                User = "root";
                ExecStart = "$sudo {zenstates}/bin/zenstates -p 0 -v 30 -f BD";
            };
            wantedBy = [ "multi-user.target" ];
        };

        # Nvidia power limit to 180W
        nv-power-limit = {
            enable = true;
            description = "Nvidia power limit control";
            after = [ "syslog.target" "systemd-modules-load.service" ];
            serviceConfig = {
                User = "root";
                ExecStart = "/home/icedborn/.config/nvidia-power-limit/nv-power-limit.sh";
            };
            wantedBy = [ "multi-user.target" ];
        };
    };

    # Do not change without checking the docs
    system.stateVersion = "22.05";
}

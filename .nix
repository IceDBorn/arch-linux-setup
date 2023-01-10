{ lib, ... }:

{
	options = {
		mounts.enable = lib.mkOption {
			type = lib.types.bool;
			default = true;
		}; # Set to false if hardware/mounts.nix is not correctly configured

		# Declare users
		main.user = {
			username = lib.mkOption {
				type = lib.types.str;
				default = "stef";
			};

			description = lib.mkOption {
				type = lib.types.str;
				default = "Stefanos";
			};

			github = {
				username = lib.mkOption {
					type = lib.types.str;
					default = "CrazyStevenz";
				};

				email = lib.mkOption {
					type = lib.types.str;
					default = "github.ekta@aleeas.com";
				};
			};

			enable = lib.mkOption {
				type = lib.types.bool;
				default = true;
			};
		};

		work.user = {
			username = lib.mkOption {
				type = lib.types.str;
				default = "work";
			};

			description = lib.mkOption {
				type = lib.types.str;
				default = "Work";
			};

			github = {
				username = lib.mkOption {
					type = lib.types.str;
					default = "CrazyStevenz";
				};

				email = lib.mkOption {
					type = lib.types.str;
					default = "github.ekta@aleeas.com";
				};
			};

			enable = lib.mkOption {
				type = lib.types.bool;
				default = true;
			};
		};

		amd = {
			gpu.enable = lib.mkOption {
				type = lib.types.bool;
				default = true;
			};

			cpu = {
				enable = lib.mkOption {
					type = lib.types.bool;
					default = true;
				};

				undervolt = {
					value = lib.mkOption {
						type = lib.types.str;
						default = "-p 0 -v 30 -f AE"; # Pstate 0, 1.25 voltage, 4400 clock speed
					};

					enable = lib.mkOption {
						type = lib.types.bool;
						default = true;
					};
				};
			};
		};

		nvidia = {
			power-limit = {
				value = lib.mkOption {
					type = lib.types.str;
					default = "242"; # RTX 3070
				};

				enable = lib.mkOption {
					type = lib.types.bool;
					default = true;
				};
			};

			enable = lib.mkOption {
				type = lib.types.bool;
				default = false;
			};
		};

		intel.enable = lib.mkOption {
			type = lib.types.bool;
			default = false;
		};

		laptop.enable = lib.mkOption {
			type = lib.types.bool;
			default = false;
		};

		virtualisation-settings = {
			docker.enable = lib.mkOption {
				type = lib.types.bool;
				default = true;
			}; # Container manager

			libvirtd.enable = lib.mkOption {
				type = lib.types.bool;
				default = true;
			}; # A daemon that manages virtual machines

			lxd.enable = lib.mkOption {
				type = lib.types.bool;
				default = true;
			}; # Container daemon

			spiceUSBRedirection.enable = lib.mkOption {
				type = lib.types.bool;
				default = true;
			}; # Passthrough USB devices to vms

			waydroid.enable = lib.mkOption {
				type = lib.types.bool;
				default = true;
			}; # Android container
		};

		desktop-environment = {
			gnome = {
				enable = lib.mkOption {
					type = lib.types.bool;
					default = true;
				};

				configuration = {
					clock-date.enable = lib.mkOption {
						type = lib.types.bool;
						default = true;
					};

					caffeine.enable = lib.mkOption {
						type = lib.types.bool;
						default = false;
					};
				};
			};

			hyprland.enable = lib.mkOption {
				type = lib.types.bool;
				default = true;
			};
		};

		firefox-privacy.enable = lib.mkOption {
			type = lib.types.bool;
			default = false;
		};
	};
}

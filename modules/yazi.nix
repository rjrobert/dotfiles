{pkgs, ...}: let
	yazi-plugins = pkgs.fetchFromGitHub {
		owner = "yazi-rs";
		repo = "plugins";
		rev = "e95c7b384e7b0a9793fe1471f0f8f7810ef2a7ed";
    hash = "sha256-TUS+yXxBOt6tL/zz10k4ezot8IgVg0/2BbS8wPs9KcE='";
	};
in {
	programs.yazi = {
		enable = true;
    enableFishIntegration = true;
		shellWrapperName = "y";

		settings = {
			mgr = {
				show_hidden = true;
			};
			preview = {
				max_width = 1000;
				max_height = 1000;
			};
		};

		plugins = {
			chmod = "${yazi-plugins}/chmod.yazi";
			full-border = "${yazi-plugins}/full-border.yazi";
			toggle-pane = "${yazi-plugins}/toggle-pane.yazi";
			starship = pkgs.fetchFromGitHub {
				owner = "Rolv-Apneseth";
				repo = "starship.yazi";
				rev = "a63550b2f91f0553cc545fd8081a03810bc41bc0";
        hash = "sha256-PYeR6fiWDbUMpJbTFSkM57FzmCbsB4W4IXXe25wLncg=";
			};
		};

		initLua = ''
			require("full-border"):setup()
			require("starship"):setup()
		'';

		keymap = {
			mgr.prepend_keymap = [
				{
					on = "T";
					run = "plugin toggle-pane max-preview";
					desc = "Maximize or restore the preview pane";
				}
				{
					on = ["c" "m"];
					run = "plugin chmod";
					desc = "Chmod on selected files";
				}
			];
		};
	};
}

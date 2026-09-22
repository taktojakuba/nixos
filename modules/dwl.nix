{ config, lib, pkgs, ... }:

{
	programs.dwl = {
		enable = true;
		package = (pkgs.dwl.override {
			wlroots_0_19 = pkgs.wlroots_0_20;
		}).overrideAttrs {
			src = pkgs.fetchFromGitHub {
				owner = "taktojakuba";
				repo = "dwl";
				rev = "4e54d2cc3e421fb4f294b7586546a4f6c32e6630";
				hash = "sha256-Mna51r8OsCwoliG5a8laLFTgV8x+XmEuMWcBfodSwQs=";
			};
			postPatch = ''
				sed -i 's/caps2super:super/caps:super/' config.def.h
			'';
		};
	};
}

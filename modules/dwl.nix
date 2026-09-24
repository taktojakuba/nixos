{ config, lib, pkgs, ... }:

{
	programs.dwl = {
		enable = true;
		package = (pkgs.dwl.override {
			wlroots_0_20 = pkgs.wlroots_0_20;
		}).overrideAttrs {
			src = /home/kuba/dwl;
			postPatch = ''
				sed -i 's/caps2super:super/caps:super/' config.def.h
			'';
		};
	};
}

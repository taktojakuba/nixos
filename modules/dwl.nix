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
				rev = "902c725dd5f3078c9e11af4cecdfa43701ce52b5";
				hash = "sha256-uLzWSkB3glHCZF4AKV1Czv+i0oSbZmfpBy0gA9xlKyU=";
			};
			postPatch = ''
				sed -i 's/caps2super:super/caps:super/' config.def.h
			'';
		};
	};
}

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
				rev = "e1a6693138097b2ab28559948434a6b636741d07";
				hash = "sha256-b3pmE8I87M8nkJ51KHFtLKdZ8vDf1AMaRrlx/vtcGJg=";
			};
			postPatch = ''
				sed -i 's/caps2super:super/caps:super/' config.def.h
			'';
		};
	};
}

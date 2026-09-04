# Custom dwl built from ~/dwl (own config + source) using wlroots 0.20.
#
# Used as a Nixpkgs overlay, e.g. in configuration.nix:
#
#   nixpkgs.overlays = [ (import ./dwl.nix) ];
#
# This overrides the stock NixOS `dwl` package so that:
#   - the source comes from the local ~/dwl checkout (config.h, colors.c,
#     dwl-ipc, scripts-referencing config, etc.), and
#   - it builds against wlroots 0.20 (matching the `wlroots-0.20` pkg-config
#     name in ~/dwl/config.mk) instead of the stock wlroots 0.19.
final: prev:
let
  # Copy of the local dwl checkout, excluding .git. Using builtins.path makes
  # the derivation re-evaluate whenever ~/dwl changes.
  dwl-src = builtins.path {
    path = /home/kuba/dwl;
    name = "dwl";
    filter = path: _type:
      baseNameOf path != ".git";
  };
in
{
  dwl = prev.dwl.overrideAttrs (old: {
    pname = "dwl";
    version = "0.8-custom";

    src = dwl-src;

    nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ (with final; [ gnumake ]);

    # dwl already ships a pre-generated config.h and links against wlroots-0.20,
    # so drop the stock default plumbing and swap the wlroots build input.
    configH = null;
    postPatch = "";
    buildInputs =
      (map
        (x: if x.pname == "wlroots" then final.wlroots_0_20 else x)
        (old.buildInputs or [ ]))
      ++ (with final; [ libx11 libxcb-wm xwayland ]);

    # Remove stale build artifacts copied from the working tree.
    preConfigure = ''
      make clean
    '';

    makeFlags = [
      "PKG_CONFIG=${final.pkg-config}/bin/pkg-config"
      "WAYLAND_SCANNER=${final.wayland-scanner}/bin/wayland-scanner"
      "PREFIX=$(out)"
      "MANDIR=$(man)/share/man"
      ''XWAYLAND="-DXWAYLAND"''
      ''XLIBS="xcb xcb-icccm"''
    ];
  });
}

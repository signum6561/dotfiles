{
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    pyright
    black
    nil
    nixfmt-rfc-style
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
  };

  programs.helix.settings = {
    theme = "catppuccin_macchiato";

    editor = {
      line-number = "relative";
      cursorline = true;
      color-modes = true;
      indent-guides = {
        render = true;
      };

      cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
    };

    keys.insert = {
      up = "no_op";
      down = "no_op";
      left = "no_op";
      right = "no_op";
    };

    keys.normal = {
      up = "no_op";
      down = "no_op";
      left = "no_op";
      right = "no_op";
    };
  };

  programs.helix.languages = {
    language = [
      {
        name = "python";
        language-servers = [ "pyright" ];
        formatter = {
          command = lib.getExe pkgs.black;
          agrs = [ "-" ];
        };
      }
      {
        name = "nix";
        auto-format = true;
        language-servers = [ "nil" ];

        formatter = {
          command = lib.getExe pkgs.nixfmt-rfc-style;
          args = [ ];
        };
      }
    ];
  };
}

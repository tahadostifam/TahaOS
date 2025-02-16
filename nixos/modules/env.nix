{
  environment.sessionVariables = rec {
    TERMINAL = "gnome-terminal";
    EDITOR = "nvim";
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [
      "${XDG_BIN_HOME}"
    ];
  };
}

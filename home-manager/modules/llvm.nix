{
  home.packages = with pkgs; [
    llvm_18.lib
    llvm_18.dev
    libxml2
  ];

  home.sessionVariables = {
    LIBRARY_PATH="${pkgs.llvm_18.lib}/lib:${pkgs.libxml2}/lib:$LIBRARY_PATH";
    LLVM_SYS_180_PREFIX="${pkgs.llvm_18.dev}";
  };
}

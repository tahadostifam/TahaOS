{ pkgs, ... }: {
  home.packages = with pkgs; [
    llvm_18.lib
    llvm_18.dev
    libxml2
    gcc
    glibc
    isl
    libffi
    libffi.dev
    cmake
    gnumake
    clang-tools
  ];

  home.sessionVariables = {
    LIBRARY_PATH="${pkgs.glibc}/lib:${pkgs.gcc_multi}/lib:${pkgs.llvm_18.lib}/lib:${pkgs.libxml2}/lib:${pkgs.libffi}/lib";
    LLVM_SYS_180_PREFIX="${pkgs.llvm_18.dev}";
  };
}

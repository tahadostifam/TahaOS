{ environment, ... }: {
  environment.systemPackages = [
    pkgs.dart
    pkgs.android-studio-full
  ];
}

build-vm:
	sudo nixos-rebuild build-vm --flake ./#starlabs

home-manager:
	home-manager switch --flake .
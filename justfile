_default:
	@just --list

# - Defaults to the current hostname.
# - Will fail if the hostname does not have a valid configuration.
#
# Install the configuration for the given system.
install hostname=shell('hostname'):
	@git add .
	@home-manager switch --flake .#{{hostname}}
	@git commit -m "Generation #`git log -1 --pretty=%B | tr -d -c 0-9 | awk '{print $1 + 1}'`"

# - Temporarily installs home-manager so that the current flake can be
#   bootstrapped.
# - Unnecessary for existing installations.
#
# Prep the shell for initial install.
bootstrap:
	@nix shell \
		nixpkgs#home-manager \
		nixpkgs#just

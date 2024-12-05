_default:
	@just --list

# - Defaults to the current hostname.
# - Will fail if the hostname does not have a valid configuration.
#
# Install the given configuration.
install hostname=shell('hostname'): _stage (_switch hostname)

# - Defaults to the current hostnmae.
# - Will fail if the hostname does not have a valid configuration.
# - If successful, commits the changes and pushes to GitHub.
# 
# Install the given configuration and push to GitHub.
commit hostname=shell('hostname'): _stage (_switch hostname)  _commit

# Reset to the last committed configuration.
reset hostname=shell('hostname'): _reset (_switch hostname)

# Initialize a new configuration file for the given hostname.
init hostname=shell('hostname'):
	@mkdir -p systems/{{hostname}}
	@cp templates/systems/home.nix systems/{{hostname}}/home.nix
	@echo "Done! Remember to add \"{{hostname}}\" to the devices list in flake.nix."

# Initialize a new configuration file for the given construct.
create type name:
	@cp templates/{{type}}.nix {{type}}s/{{name}}.nix
	@sed -i 's/<<NAME>>/{{name}}/g' {{type}}s/{{name}}.nix
	@echo "Done! Remember to add ./{{name}}.nix to the imports list in {{type}}s/default.nix."

_commit:
	@git commit -m "Generation #`git log -1 --pretty=%B | tr -d -c 0-9 | awk '{print $1 + 1}'`"
	@git push origin master

_reset:
	@git fetch origin
	@git reset --hard origin/master

_stage:
	@git add .

_switch hostname:
	@home-manager switch --flake .#{{hostname}}

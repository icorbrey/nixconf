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

#!/bin/sh

# Author:     Héctor Molinero Fernández <hector@molinero.xyz>
# Repository: https://github.com/hectorm/hblock
# License:    MIT, https://opensource.org/licenses/MIT

set -eu
export LC_ALL=C

main() {
	scriptDir=$(dirname "$(readlink -f "$0")")
	hblock="$scriptDir/../../hblock"
	hosts=$(readlink -f "${1:?}")

	$hblock -qO- \
		--sources "file://$hosts" \
		--header '' \
		--footer '' \
		--template 'local-zone: "\1" redirect\nlocal-data: "\1 A \2"' \
		--comment '#'
}

main "$@"

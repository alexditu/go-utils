#!/bin/bash

WORKSPACE="$(dirname "$(realpath "$0")")"
BIN_DIR="${WORKSPACE}/binary"

echo "Using WORKSPACE: $WORKSPACE"



# {path, output name} pairs
declare -A BINARIES=(\
["test/version"]="test_version" \
)

build () {
	mkdir -p "${BIN_DIR}"

	for k in "${!BINARIES[@]}"; do
		LD_FLAGS="\
		-X github.com/alexditu/go-utils/pkg/version.commitHash=$(git rev-parse --short HEAD) \
		-X github.com/alexditu/go-utils/pkg/version.branchName=$(git rev-parse --abbrev-ref HEAD) \
		-X github.com/alexditu/go-utils/pkg/version.binaryName=${BINARIES[$k]}"

		echo "Building ${k} to ${BIN_DIR}"

		GOARCH=amd64 GOOS=linux \
		go build -o "${BIN_DIR}/${BINARIES[$k]}" \
				-ldflags "${LD_FLAGS}" \
				"./${k}"
	done
}

clean () {
	rm -rfv "${BIN_DIR}"
}

#
# main
#
ACCEPTED_COMMANDS="build clean"
if [ $# -lt 1 ]; then
	echo "Usage: $0 <cmd>"
	echo -e "\twhere cmd is one of: ${ACCEPTED_COMMANDS}"
	exit 1
fi

CMD="$1"

case "${CMD}" in
	build)
		build
		;;
	clean)
		clean
		;;
	*)
		echo "Unkown command ${CMD}. Must be one of: ${ACCEPTED_COMMANDS}"
		;;
esac
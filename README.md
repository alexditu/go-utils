# go-utils
Common golang utilities functions used by other projects

## pkg/version
Generic binary versioning support. Variables are configured at build time using -ldflags:
```
LD_FLAGS="\
-X github.com/alexditu/go-utils/pkg/version.commitHash=$(git rev-parse --short HEAD) \
-X github.com/alexditu/go-utils/pkg/version.branchName=$(git rev-parse --abbrev-ref HEAD) \
-X github.com/alexditu/go-utils/pkg/version.binaryName=${BIN_NAME} \
-X github.com/alexditu/go-utils/pkg/version.major=1 \
-X github.com/alexditu/go-utils/pkg/version.minor=0"
```

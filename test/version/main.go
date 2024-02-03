package main

import (
	"fmt"

	"github.com/alexditu/go-utils/pkg/version"
)

func main() {
	fmt.Printf("Running '%s' version '%s'\n", version.BinaryName(), version.String())
}

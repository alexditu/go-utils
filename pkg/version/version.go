package version

import "fmt"

var commitHash string
var branchName string
var binaryName string
var major string
var minor string

func String() string {
	return fmt.Sprintf("%s.%s (%s/%s)", major, minor, branchName, commitHash)
}

func BinaryName() string {
	return binaryName
}

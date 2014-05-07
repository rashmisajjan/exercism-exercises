package strand

import "strings"

var transcriber = strings.NewReplacer(
	"G", "C",
	"C", "G",
	"T", "A",
	"A", "U",
)

func ToRna(s string) string {
	return transcriber.Replace(s)
}

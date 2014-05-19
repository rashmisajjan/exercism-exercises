package wc

import (
	"strings"
	"unicode"
)

func WordCount(s string) Histogram {
	counts := make(Histogram)
	for _, word := range strings.FieldsFunc(s, func(r rune) bool {
		return !unicode.IsLetter(r) && !unicode.IsDigit(r)
	}) {
		counts[strings.ToLower(word)]++
	}
	return counts
}

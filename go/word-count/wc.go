package wc

import (
	"strings"
	"unicode"
)

func WordCount(s string) Histogram {
	counts := make(Histogram)
	for _, word := range strings.FieldsFunc(s, func(r rune) bool {
		return !unicode.In(r, unicode.Letter, unicode.Digit)
	}) {
		counts[strings.ToLower(word)]++
	}
	return counts
}

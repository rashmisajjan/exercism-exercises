package wc

import (
	"regexp"
	"strings"
)

var wordRe = regexp.MustCompile(`\w+`)

func WordCount(s string) Histogram {
	counts := make(Histogram)
	for _, word := range wordRe.FindAllString(s, -1) {
		counts[strings.ToLower(word)]++
	}
	return counts
}

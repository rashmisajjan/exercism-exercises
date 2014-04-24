package bob

import (
	"strings"
	"unicode"
)

func Hey(text string) string {
	switch {
	case isSilence(text):
		return "Fine. Be that way!"
	case isShouting(text):
		return "Woah, chill out!"
	case isQuestion(text):
		return "Sure."
	default:
		return "Whatever."
	}
}

func isSilence(text string) bool {
	return strings.IndexFunc(text, func(r rune) bool {
		return !unicode.IsSpace(r)
	}) == -1
}

func isShouting(text string) bool {
	return strings.IndexFunc(text, unicode.IsUpper) != -1 &&
		strings.IndexFunc(text, unicode.IsLower) == -1
}

func isQuestion(text string) bool {
	return strings.HasSuffix(text, "?")
}

package bottles

import (
	"fmt"
	"strings"
	"unicode"
	"unicode/utf8"
)

func Verse(n int) string {
	bottlesNow := bottles(n)
	action := takeOrGo(n)
	bottlesThen := bottles(next(n))

	return fmt.Sprintf("%s on the wall, %s.\n%s, %s on the wall.\n",
		upperFirst(bottlesNow), bottlesNow, action, bottlesThen)
}

func Verses(start, end int) string {
	verses := make([]string, start-end+1)
	for i := start; i >= end; i-- {
		verses[start-i] = Verse(i)
	}
	return strings.Join(verses, "\n") + "\n"
}

func Sing() string {
	return Verses(99, 0)
}

func bottles(n int) string {
	var s string
	switch n {
	case 0:
		s = "no more bottles"
	case 1:
		s = "1 bottle"
	default:
		s = fmt.Sprintf("%d bottles", n)
	}
	return s + " of beer"
}

func takeOrGo(n int) string {
	var s string
	switch n {
	case 0:
		return "Go to the store and buy some more"
	case 1:
		s = "Take it"
	default:
		s = "Take one"
	}
	return s + " down and pass it around"
}

func next(n int) int {
	switch n {
	case 0:
		return 99
	default:
		return n - 1
	}
}

// Adapted from
// https://groups.google.com/forum/#!msg/golang-nuts/WfpmVDQFecU/-1IBD5KI7GEJ
func upperFirst(s string) string {
	if s == "" {
		return ""
	}
	r, n := utf8.DecodeRuneInString(s)
	return string(unicode.ToUpper(r)) + s[n:]
}

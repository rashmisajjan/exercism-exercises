package phonenumber

import (
	"fmt"
	"strings"
	"unicode"
)

const BadNumber = "0000000000"

// filter removes all runes from a string that don't pass the predicate
// function.
func filter(s string, predicate func(rune) bool) string {
	return strings.Map(func(r rune) rune {
		if predicate(r) {
			return r
		}
		return -1
	}, s)
}

// Number normalizes a raw phone number.
// If a number is determined to be invalid, BadNumber is returned.
func Number(raw string) string {
	digits := filter(raw, unicode.IsDigit)
	switch len(digits) {
	case 10:
		return digits
	case 11:
		if digits[0] == '1' {
			return digits[1:]
		}
		fallthrough
	default:
		return BadNumber
	}
}

// AreaCode returns the area code for a given raw phone number.
func AreaCode(raw string) string {
	return Number(raw)[:3]
}

// Format cleans a raw phone number and formats it in an easily readable format.
func Format(raw string) string {
	number := Number(raw)
	return fmt.Sprintf("(%s) %s-%s", number[:3], number[3:6], number[6:])
}

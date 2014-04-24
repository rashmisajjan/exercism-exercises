package phonenumber

import (
	"fmt"
	"strings"
	"unicode"
)

func Number(raw string) string {
	digits := strings.Map(func(r rune) rune {
		if unicode.IsDigit(r) {
			return r
		} else {
			return -1
		}
	}, raw)
	switch len(digits) {
	case 10:
		return digits
	case 11:
		if digits[0] == '1' {
			return digits[1:]
		}
		fallthrough
	default:
		return "0000000000"
	}
}

func AreaCode(raw string) string {
	return Number(raw)[:3]
}

func Format(raw string) string {
	number := Number(raw)
	return fmt.Sprintf("(%s) %s-%s", number[:3], number[3:6], number[6:])
}

package romannumerals

import (
	"bytes"
	"fmt"
)

type numeral struct {
	value          int
	representation string
}

var romanNumerals = []numeral{
	numeral{1000, "M"},
	numeral{900, "CM"},
	numeral{500, "D"},
	numeral{400, "CD"},
	numeral{100, "C"},
	numeral{90, "XC"},
	numeral{50, "L"},
	numeral{40, "XL"},
	numeral{10, "X"},
	numeral{9, "IX"},
	numeral{5, "V"},
	numeral{4, "IV"},
	numeral{1, "I"},
}

// ToRomanNumeral converts an int n into a roman numeral.
// If n is less than 1 or greater than 3999, a non-nil error is returned.
func ToRomanNumeral(n int) (string, error) {
	if n < 1 || n >= 4000 {
		return "", fmt.Errorf("%d can't be represented as a roman numeral", n)
	}
	var buffer bytes.Buffer
	for _, r := range romanNumerals {
		for ; n >= r.value; n -= r.value {
			buffer.WriteString(r.representation)
		}
	}
	return buffer.String(), nil
}

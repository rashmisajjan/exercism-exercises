package romannumerals

import "bytes"

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

func ToRomanNumeral(n int) string {
	var buffer bytes.Buffer
	for _, r := range romanNumerals {
		for ; n >= r.value; n -= r.value {
			buffer.WriteString(r.representation)
		}
	}
	return buffer.String()
}

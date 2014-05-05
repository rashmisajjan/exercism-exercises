package hexadecimal

// ToDecimal converts a string representing a hexadecimal number into
// an int64. If the string contains invalid digits, the result is 0.
func ToDecimal(digits string) int64 {
	var result, value int64
	exponent := uint(4 * len(digits))
	for _, d := range digits {
		exponent -= 4
		switch {
		case d >= '0' && d <= '9':
			value = int64(d - '0')
		case d >= 'a' && d <= 'f':
			value = int64(d - 'a' + 10)
		case d >= 'A' && d <= 'F':
			value = int64(d - 'A' + 10)
		default:
			return 0
		}
		result += value * (1 << exponent)
	}
	return result
}

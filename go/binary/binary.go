package binary

func ToDecimal(digits string) int {
	result, exponent := 0, uint(len(digits))
	for _, r := range digits {
		exponent--
		switch r {
		case '0':
			continue
		case '1':
			result += 1 << exponent
		default:
			return 0
		}
	}
	return result
}

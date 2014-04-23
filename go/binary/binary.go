package binary

func ToDecimal(digits string) int {
	var result int
	for _, digit := range []byte(digits) {
		switch digit {
		case '0':
			result *= 2
		case '1':
			result = 2*result + 1
		default:
			return 0
		}
	}
	return result
}

package leap

func IsLeapYear(year int) bool {
	switch 0 {
	case year % 400:
		return true
	case year % 100:
		return false
	case year % 4:
		return true
	default:
		return false
	}
}

package leap

func IsLeapYear(year int) bool {

	divisibleBy := func(d int) bool {
		return year%d == 0
	}

	return divisibleBy(4) && (!divisibleBy(100) || divisibleBy(400))
}

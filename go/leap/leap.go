package leap

// IsLeapYear determines whether a given year is a leap year or not.
func IsLeapYear(year int) bool {
    // Return true if the year is divisible by 4 and
    // either divisible by 400
    // or not divisible by 100.
    // Return false otherwise.
	return year%4 == 0 && (year%100 != 0 || year%400 == 0)
}

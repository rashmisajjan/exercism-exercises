package clock

import "fmt"

// A Clock represents a clock time in hours and minutes.
type Clock int

// New takes h hours and m minutes and returns a Clock object representing
// that time.
// Both h and m can be out of range for a clock time, i.e. be negative or
// greater than 24 resp. 60.
func New(h, m int) Clock {
	c := Clock((h*60 + m) % (24 * 60))
	for c < 0 {
		c += (24 * 60)
	}
	return c
}

// String returns a string representation of clock time c.
func (c Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c/60, c%60)
}

// Add returns a new Clock with m minutes added to c.
func (c Clock) Add(m int) Clock {
	return New(0, int(c)+m)
}

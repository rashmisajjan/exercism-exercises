package gigasecond

import "time"

// A Gigasecond is 10^9 seconds.
const Gigasecond = 1e9 * time.Second

// AddGigasecond returns the time (t + Gigasecond).
func AddGigasecond(t time.Time) time.Time {
	return t.Add(Gigasecond)
}

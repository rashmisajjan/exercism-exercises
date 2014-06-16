package octal

import "fmt"

func ParseOctal(s string) (int64, error) {
	var n int64
	for i := 0; i < len(s); i++ {
		d := s[i]
		if '0' <= d && d <= '7' {
			n = 8*n + int64(d-'0')
		} else {
			return 0, fmt.Errorf("octal.ParseOctal(%q): invalid digit %q", s, d)
		}
	}
	return n, nil
}

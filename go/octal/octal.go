package octal

import "fmt"

func ToDecimal(s string) int64 {
	var result int64
	if _, err := fmt.Sscanf(s, "%o", &result); err != nil {
		return 0
	} else {
		return result
	}
}

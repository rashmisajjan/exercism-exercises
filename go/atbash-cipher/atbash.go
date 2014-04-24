package atbash

import (
	"bytes"
	"strings"
)

func Atbash(plain string) string {
	var buffer, result bytes.Buffer
	for _, r := range plain {
		switch {
		case r >= 'a' && r <= 'z':
			buffer.WriteRune('z' - (r - 'a'))
		case r >= 'A' && r <= 'Z':
			buffer.WriteRune('z' - (r - 'A'))
		case r >= '0' && r <= '9':
			buffer.WriteRune(r)
		}
	}
	for buffer.Len() > 0 {
		result.Write(buffer.Next(5))
		result.WriteByte(' ')
	}
	return strings.TrimSpace(result.String())
}

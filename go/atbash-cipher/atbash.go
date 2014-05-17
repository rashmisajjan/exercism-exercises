package atbash

import "bytes"

func Atbash(plain string) string {
	cipher := make([]byte, 0, len(plain)+len(plain)/5)
	for _, b := range []byte(plain) {
		switch {
		case b >= 'a' && b <= 'z':
			cipher = append(cipher, 'z'-b+'a')
		case b >= 'A' && b <= 'Z':
			cipher = append(cipher, 'z'-b+'A')
		case b >= '0' && b <= '9':
			cipher = append(cipher, b)
		default:
			continue
		}
		if len(cipher)%6 == 5 {
			cipher = append(cipher, ' ')
		}
	}
	return string(bytes.TrimSuffix(cipher, []byte{' '}))
}

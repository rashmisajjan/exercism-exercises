package raindrops

import "strconv"

var sounds = []struct {
	factor int
	sound  string
}{
	{3, "Pling"},
	{5, "Plang"},
	{7, "Plong"},
}

func Convert(n int) string {
	output := ""
	for _, s := range sounds {
		if n%s.factor == 0 {
			output += s.sound
		}
	}
	if len(output) > 0 {
		return output
	}
	return strconv.Itoa(n)
}

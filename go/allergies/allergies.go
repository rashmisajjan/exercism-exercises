package allergies

var allergens = map[int]string{
	1:   "eggs",
	2:   "peanuts",
	4:   "shellfish",
	8:   "strawberries",
	16:  "tomatoes",
	32:  "chocolate",
	64:  "pollen",
	128: "cats",
}

func Allergies(score int) []string {
	result := make([]string, 0)
	for i := 1; score > 0; i *= 2 {
		if score%2 == 1 {
			if allergen, ok := allergens[i]; ok {
				result = append(result, allergen)
			}
		}
		score >>= 1
	}
	return result
}

func AllergicTo(score int, allergen string) bool {
	allergies := Allergies(score)
	for _, allergy := range allergies {
		if allergy == allergen {
			return true
		}
	}
	return false
}

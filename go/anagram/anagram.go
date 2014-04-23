package anagram

import (
	"sort"
	"strings"
)

func Detect(reference string, candidates []string) []string {
	referenceAnagram := anagramFromString(reference)
	anagrams := make([]string, 0, len(candidates))
	for _, candidate := range candidates {
		candidateAnagram := anagramFromString(candidate)
		if referenceAnagram.anagramTo(candidateAnagram) {
			anagrams = append(anagrams, candidateAnagram.Lower)
		}
	}
	return anagrams
}

type anagram struct {
	Lower  string
	Sorted []rune
}

func anagramFromString(s string) anagram {
	lower := strings.ToLower(s)
	return anagram{lower, sortedRunes(lower)}
}

func (a *anagram) anagramTo(b anagram) bool {
	return a.Lower != b.Lower && equalRunes(a.Sorted, b.Sorted)
}

func equalRunes(a, b []rune) bool {
	if len(a) != len(b) {
		return false
	}
	for i := 0; i < len(a); i++ {
		if a[i] != b[i] {
			return false
		}
	}
	return true
}

// The following code is adapted from
// http://stackoverflow.com/questions/18171136/golang-sort-a-slice-of-runes

type runeSlice []rune

func (p runeSlice) Len() int           { return len(p) }
func (p runeSlice) Less(i, j int) bool { return p[i] < p[j] }
func (p runeSlice) Swap(i, j int)      { p[i], p[j] = p[j], p[i] }

func sortedRunes(s string) []rune {
	runes := []rune(s)
	sort.Sort(runeSlice(runes))
	return runes
}

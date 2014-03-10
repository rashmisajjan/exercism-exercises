class Anagram(object):

    def __init__(self, word):
        self.word = word
        self.letters = self.__normalize(word)

    @staticmethod
    def __normalize(word):
        """Return the letters of a word sorted and lowercased."""
        return sorted(word.lower())

    def is_anagram(self, candidate):
        """Check if candidate is an anagram of self.word."""
        return ((self.__normalize(candidate) == self.letters) and
                (candidate != self.word))

    def match(self, candidates):
        """Return only those candidates that are anagrams of self.word."""
        return [c for c in candidates if self.is_anagram(c)]

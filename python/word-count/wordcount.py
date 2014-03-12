from collections import Counter
import re

WORD_REGEX = re.compile(r"\w+", re.UNICODE)


class Phrase(object):

    def __init__(self, phrase):
        self.phrase = phrase

    def words(self):
        """Return an iterator of the words in the phrase."""
        return (m.group(0) for m in WORD_REGEX.finditer(self.phrase))

    def word_count(self):
        """Return a dictionary where the keys are the words in the phrase,
        normalized to lower case, and the values are the frequency of these
        words in the phrase.
        """
        return Counter(word.lower() for word in self.words())

from itertools import cycle
from random import randint
from string import ascii_lowercase


class Cipher:
    def __init__(self, key=None):
        self.key = key if key else self._generate_key()

    @staticmethod
    def _generate_key():
        return ''.join([chr(randint(ord('a'), ord('z')))
                        for _ in range(100)])

    @staticmethod
    def _normalize(plaintext):
        return ''.join(letter
                       for letter in plaintext.lower()
                       if letter.isalpha())

    @staticmethod
    def _shift(letter, shift_width):
        d = ord(letter) + shift_width
        if not ord('a') <= d <= ord('z'):
            d -= 2 * ord('a') + 4
            d %= ord('z') - ord('a')
            d += ord('a')
        return chr(d)

    def encode(self, plaintext):
        return ''.join([self._shift(l, ord(s) - ord('a'))
                        for l, s in zip(self._normalize(plaintext),
                                        cycle(self.key))])

    def decode(self, plaintext):
        return ''.join([self._shift(l, - (ord(s) - ord('a')))
                        for l, s in zip(self._normalize(plaintext),
                                        cycle(self.key))])


class Caesar(Cipher):
    _encoder = str.maketrans(ascii_lowercase,
                             ascii_lowercase[3:] + ascii_lowercase[:3])
    _decoder = str.maketrans(ascii_lowercase,
                             ascii_lowercase[-3:] + ascii_lowercase[:-3])

    def __init__(self):
        pass

    @classmethod
    def encode(cls, plaintext):
        return cls._normalize(plaintext).translate(cls._encoder)

    @classmethod
    def decode(cls, ciphertext):
        return ciphertext.translate(cls._decoder)

class Bob:
    "A lackadaisical teenager"

    def hey(self, says_the_other):
        "Bob's response to anything"
        if not says_the_other or says_the_other.isspace():
            return 'Fine. Be that way!'
        elif says_the_other.isupper():
            return 'Woah, chill out!'
        elif says_the_other[-1] == '?':
            return 'Sure.'
        return 'Whatever.'

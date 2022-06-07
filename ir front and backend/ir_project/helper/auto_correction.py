import re
from textblob import Word


def correct_word_spelling(query):
    words = re.split(' ',query)
    print(words)
    correct_query = ''
    for w in words:
      word = Word(w)
      sequence = (correct_query, word.correct())
      correct_query = " ".join(sequence)
    print(correct_query)
    return  correct_query




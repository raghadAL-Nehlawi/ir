import spacy
import datefinder
import nltk
from nltk import word_tokenize
from nltk.corpus import wordnet as w
from nltk.stem.snowball import PorterStemmer
from dateparser.search import search_dates  # another option

nltk.download('wordnet')

def stemming_words(data):
    porter = PorterStemmer()
    token_words = word_tokenize(data)
    token_words
    stem_sentence = []
    for word in token_words:
        stem_sentence.append(porter.stem(word))
        stem_sentence.append(" ")
    return "".join(stem_sentence)


nlp = spacy.load('en_core_web_sm')
def lemma_words(data):
    wordnet_lemmatizer = w.WordNetLemmatizer()

    doc = nlp(data)
    sentence_words = nltk.word_tokenize(data)
    res = ''
    for word in sentence_words:
        res.join(' ' ,wordnet_lemmatizer.lemmatize(word))

    return res



def date_prossing(data):

    str1 = "Let's meet sometime next Thursday"
    print(search_dates(str1))
    matches = datefinder.find_dates(data)
    for match in matches:
        print(match)
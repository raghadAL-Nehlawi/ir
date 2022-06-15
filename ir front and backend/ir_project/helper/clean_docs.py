import re
import string
import nltk as nltk
import spacy
from helper.stemming_words import stemming_words, lemma_words, date_prossing


def cleanDocs(documents):

  documents_clean = []
  i = 1
  nltk.download('punkt')
  sp = spacy.load('en_core_web_sm')
  all_stopwords = sp.Defaults.stop_words
  print(all_stopwords)
  print(len(documents))
  doc_length = len(documents)
  while i < doc_length:
      if documents[str(i)] is not None:
          if len(documents[str(i)]) == 7:
             if  documents[str(i)]['abstract'] is not None:

                doc = documents[ str(i)]['abstract']
                document_test = re.sub(r'[^\x00-\x7F]+', ' ', doc)
                document_test = re.sub(r'@\w+', '', document_test)
                document_test = document_test.lower()
                document_test = replceShortcuts(document_test)
                document_test = re.sub(r'[%s]' % re.escape(string.punctuation), ' ', document_test)
                document_test = re.sub(r'\s{2,}', ' ', document_test)
                document_test = stemming_words(document_test)
                #document_test = lemma_words(document_test)
                document_test = nltk.word_tokenize(document_test)
                document_test = [word for word in document_test if not word in all_stopwords]
                document_test = ' '.join(document_test)
               # document_test =
                print(document_test)
                #TODO ADD PROSSING DATE
                #date_prossing(document_test)

                documents_clean.append(document_test)
                documents[str(i)]["cleanDocs"] = document_test
             else:
                 documents_clean.append('')
          else:
              documents_clean.append('')
      else:
          documents_clean.append('')

      i += 1
      if i > doc_length:
          break
 # print(documents_clean)

  return documents;



def replceShortcuts(s):
    import json
    f = open('./files/shortcuts.json')
    data = json.load(f)
    shourtcuts = data["shortcut"]
    keys = shourtcuts.keys()
    for key in keys:
        s = s.replace(key,shourtcuts[key])
    f.close()
    return s


def cleanQuery(query):
    sp = spacy.load('en_core_web_sm')
    all_stopwords = sp.Defaults.stop_words
    document_test = re.sub(r'[^\x00-\x7F]+', ' ', query)
    document_test = re.sub(r'@\w+', '', document_test)
    document_test = document_test.lower()
    document_test = replceShortcuts(document_test)
    document_test = re.sub(r'[%s]' % re.escape(string.punctuation), ' ', document_test)
    document_test = re.sub(r'\s{2,}', ' ', document_test)
    document_test = stemming_words(document_test)
    # document_test = lemma_words(document_test)
    document_test = nltk.word_tokenize(document_test)
    document_test = [word for word in document_test if not word in all_stopwords]
    document_test = ' '.join(document_test)
    return document_test
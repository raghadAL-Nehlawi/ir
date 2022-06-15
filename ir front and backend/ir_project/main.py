import re
from collections import defaultdict
import nltk

from helper.caluclate_tfidf import get_similar_articles_Using_clusterd
from helper.clean_docs import cleanDocs
from helper.eveltion import scoreRecall, scorePrecision, scorePrecision_rank
from helper.file_helper import get_data_structerd_dataset, saveQueriesQesultInFile, readSavedQueries
from helper.read_query_value import fetchQueries, getExpectedResult, getQueryResult

#calculateK()
from helper.stemming_words import date_prossing

PATH_TO_CRAN_TXT = 'C:/Users/Admin/Desktop/test/cacm/cacm.all'
PATH_TO_CRAN_QRY = 'C:/Users/Admin/Desktop/test/cacm/query.text'
PATH_TO_CRAN_REL = 'C:/Users/Admin/Desktop/test/cacm/qrels.text'

date_prossing("BLLAA 5552/ 22 ")

###    ----------- get dataset ----------- ###
ID_marker = re.compile('\.I.')
txt_data = defaultdict(dict)

txt_data = get_data_structerd_dataset(PATH_TO_CRAN_TXT, ID_marker)
cleanedDocs = cleanDocs(txt_data)

queries = fetchQueries()
nltk.download('punkt')

#print('result', getQueryResult(cleanedDocs, queries))
#getExpectedResult()

expected = getExpectedResult()
real = readSavedQueries()
#getQueryResult(cleanedDocs, queries)
#saveQueriesQesultInFile(real)



get_similar_articles_Using_clusterd("22", cleanedDocs)
#print("Precision")
#precision = scorePrecision(real, expected)
#print(precision)
#print("Recall")
#print(scoreRecall(real,expected))
#print("scorePrecision_rank")
#print(scorePrecision_rank(precision, real, expected))
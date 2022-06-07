import re
from collections import defaultdict

from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity

from helper.caluclate_tfidf import calculateTfIdf
from helper.clean_docs import cleanDocs
from helper.clustring import kMeans
from helper.file_helper import get_data_structerd_dataset

PATH_TO_CRAN_TXT = 'C:/Users/Admin/Desktop/test/cacm/cacm.all'
PATH_TO_CRAN_QRY = 'C:/Users/Admin/Desktop/test/cacm/query.text'
PATH_TO_CRAN_REL = 'C:/Users/Admin/Desktop/test/cacm/qrels.text'



###    ----------- get dataset ----------- ###
ID_marker = re.compile('\.I.')
txt_data = defaultdict(dict)

txt_data = get_data_structerd_dataset(PATH_TO_CRAN_TXT, ID_marker)
cleanedDocs = cleanDocs(txt_data)

tfidf_matrix = kMeans(calculateTfIdf(cleanedDocs))['data']
tfidf_vectorizer = TfidfVectorizer()
data = []
coss = []
tfidf_matrix =  tfidf_vectorizer.fit_transform(kMeans(calculateTfIdf(cleanedDocs)))

q_vec = tfidf_vectorizer.transform(['tesssstt'])
coss = cosine_similarity(tfidf_matrix, q_vec).flatten()
cos_sorted = sorted(coss, reverse=True)
for k, v in enumerate(cos_sorted):
         if v != 0.0:
            print("cos Similaritas:", v)
            data.append({"body": cleanedDocs[k]})
            print(cleanedDocs[k])
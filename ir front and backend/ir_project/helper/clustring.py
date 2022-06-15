from collections import defaultdict
import re
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer

from helper.clean_docs import cleanDocs
from helper.file_helper import get_data_structerd_dataset
from sklearn.cluster import KMeans


PATH_TO_CRAN_TXT = 'C:/Users/Admin/Desktop/test/cacm/cacm.all'
PATH_TO_CRAN_QRY = 'C:/Users/Admin/Desktop/test/cacm/query.text'
PATH_TO_CRAN_REL = 'C:/Users/Admin/Desktop/test/cacm/qrels.text'


def calculateK():
###    ----------- get dataset ----------- ###
    ID_marker = re.compile('\.I.')
    txt_data = defaultdict(dict)
    txt_data = get_data_structerd_dataset(PATH_TO_CRAN_TXT, ID_marker)

    map =  cleanDocs(txt_data)
    docs = []

    for m in map:
        if (map[m] != None):
            if ('cleanDocs' in map[m].keys()):
                docs.append(map[m]["cleanDocs"])

    tfidf_vectorizer = TfidfVectorizer()
    tfidf = tfidf_vectorizer.fit_transform(docs)
    X = tfidf
    wcss = []
    for i in range(1, 200):
        kmeans = KMeans(n_clusters = i, init = 'k-means++', random_state = 42)
        kmeans.fit(X)
        wcss.append(kmeans.inertia_)
    plt.plot(range(1, 200), wcss)
    plt.show()





def kMeans(map):
    docs = []

    for m in map:
        if (map[m] != None):
            if ('cleanDocs' in map[m].keys()):
                docs.append(map[m]["cleanDocs"])
    tfidf_vectorizer = TfidfVectorizer()
    tfidf = tfidf_vectorizer.fit_transform(docs)
    km = KMeans(n_clusters=30, init='k-means++', random_state=0)
    clusters = km.fit(tfidf.docs)
    labels = clusters.labels_
    df = pd.DataFrame(list(zip(tfidf.docs, labels)), columns=['vector', 'cluster'])
    df = df.sort_values(by=['cluster'])
    return km;
from collections import defaultdict
import re
import matplotlib.pyplot as plt
import pandas as pd
from helper.caluclate_tfidf import calculateTfIdf
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

    dataset =  cleanDocs(txt_data)
    tfidf = calculateTfIdf(dataset)
    X =tfidf
    wcss = []
    for i in range(1, 200):
        kmeans = KMeans(n_clusters = i, init = 'k-means++', random_state = 42)
        kmeans.fit(X)
        wcss.append(kmeans.inertia_)
    plt.plot(range(1, 200), wcss)
    plt.show()





def kMeans(tf_idf):
        km = KMeans(n_clusters=500, init='k-means++', random_state=0)
        clusters = km.fit(tf_idf)
        labels = clusters.labels_
        df = pd.DataFrame(list(zip(tf_idf, labels)), columns=['data', 'cluster'])
        df = df.sort_values(by=['cluster'])
        print(clusters);
        return df;
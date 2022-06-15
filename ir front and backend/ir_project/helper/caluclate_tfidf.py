import numpy as np
from nltk.cluster import kmeans
from sklearn.cluster import KMeans
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity

from helper.clustring import kMeans






def get_similar_articles(q,map):
    tfidf_vectorizer = TfidfVectorizer()
    data = []
    docs = []
    for m in map:
        if(map[m] != None):
            if( 'cleanDocs' in map[m] .keys()):
                 docs.append(map[m]["cleanDocs"])

    tfidf_matrix = tfidf_vectorizer.fit_transform(docs)
    q_vec = tfidf_vectorizer.transform([q])

    coss = cosine_similarity(tfidf_matrix, q_vec).flatten()
    coss = [(key, v) for key,v in enumerate(coss)]
    cos_sorted = sorted(coss, reverse=True, key = lambda x: x[1])
    for v in cos_sorted:
       if v[1] != 0.0:
            print("cos Similaritas:", v)
            if docs[v[0]] != '':
              data.append({"body": docs[v[0]],"info": map[str(v[0])]})
    return data





def get_similar_articles_Using_clusterd(q,docs):
    clusters = cisi_km.fit(docs)
    labels = clusters.labels_
    cisi_df = pd.DataFrame(list(zip(docs, labels)), columns=['vector', 'cluster'])
    cisi_df = cisi_df.sort_values(by=['cluster'])
    return y_kmeans



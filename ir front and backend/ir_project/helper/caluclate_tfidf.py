from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity


def calculateTfIdf(docs):
    tfidf_vectorizer = TfidfVectorizer()
    tfidf_matrix = tfidf_vectorizer.fit_transform(docs)
    return tfidf_matrix




def get_similar_articles(q,docs ):
    tfidf_vectorizer = TfidfVectorizer()
    data = []
    tfidf_matrix = tfidf_vectorizer.fit_transform(docs)
    q_vec = tfidf_vectorizer.transform([q])
    coss = cosine_similarity(tfidf_matrix, q_vec).flatten()
    cos_sorted = sorted(coss, reverse=True)
    for k, v in enumerate(cos_sorted):
         if v != 0.0:
            print("cos Similaritas:", v)
            data.append({"body": docs[k]})
            print(docs[k])

    return  data



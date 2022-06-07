import re
from collections import defaultdict
from  flask import Flask,jsonify,request
from helper.auto_correction import correct_word_spelling
from helper.caluclate_tfidf import get_similar_articles
from helper.clean_docs import cleanDocs, cleanQuery
from helper.file_helper import get_data_structerd_dataset

app = Flask(__name__)
PATH_TO_CRAN_TXT = 'C:/Users/Admin/Desktop/test/cacm/cacm.all'
PATH_TO_CRAN_QRY = 'C:/Users/Admin/Desktop/test/cacm/query.text'
PATH_TO_CRAN_REL = 'C:/Users/Admin/Desktop/test/cacm/qrels.text'



###    ----------- get dataset ----------- ###
ID_marker = re.compile('\.I.')
txt_data = defaultdict(dict)

txt_data = get_data_structerd_dataset(PATH_TO_CRAN_TXT, ID_marker)
cleanedDocs = cleanDocs(txt_data)
#TODO SAVE DATA


@app.after_request
def add_header(response):
    response.headers['Access-Control-Allow-Origin'] = '*'
    return response


@app.route('/search',methods=["POST"])
def index():

    query = request.form.get('query')
    correctedQuery = correct_word_spelling(query)
    print(query)
    if(correctedQuery.strip() != query.strip()):
        data =  jsonify({"status": False, "data": correctedQuery})

        return data
    else:
        trueQuery = get_similar_articles(cleanQuery(query), cleanedDocs)
        data =  jsonify({"status": True, "data": trueQuery})

        return data


if(__name__ == "__main__"):
    app.run(debug=True)

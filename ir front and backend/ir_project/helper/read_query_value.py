from helper.caluclate_tfidf import get_similar_articles
from helper.clean_docs import cleanQuery


def fetchQueries():
    queries = []

    with open('C:/Users/Admin/Desktop/test/cacm/query.text', 'r') as f:
        line = ""
        text_stage = False
        skip = False
        query = None

        for i, l in enumerate(f.readlines()):
            l = l[:-1]

            if (l.startswith(".A") or l.startswith(".B") or l.startswith(".T") or skip):
                skip = True
                text_stage = False

            if (l.startswith(".W")):
                skip = False

            elif (l.startswith(".I")):
                if (query is not None):
                    queries.append(query)
                    query = None

                query = {'id': l[l.rindex(" ") + 1:], 'text': ""}
                text_stage = False
                skip = False

            elif ((line.startswith(".W") or text_stage) and not skip):
                text_stage = True
                skip = False
                query['text'] = query['text'] + f'{l}\n'
                print(query['text'] )
            line = l

        queries.append(query)

    return queries




def getQueryResult(docs, queries):
    data = []
    for q in queries:
        result = []
        resultQuery = get_similar_articles(cleanQuery(q["text"]), docs)
        for r in resultQuery:
              print("ress", r)
              if( 'info' in r.keys() ):
                  if('id' in r["info"]):
                      result.append(r['info']['id'])
        data.append(result)
    return data


def getExpectedResult():
    queriesResult = [[]]
    index = 0

    with open('C:/Users/Admin/Desktop/test/cacm/qrels.text', 'r') as f:
        for i, l in enumerate(f.readlines()):
            data = l.split()
            if(int(data[0]) -1  == index):
                queriesResult[index].append(data[1])
            else:
                queriesResult.append([])
                queriesResult[index].append(data[1])
                index += 1
    print(queriesResult)
    return queriesResult

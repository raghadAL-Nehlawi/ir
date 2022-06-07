import re
from collections import defaultdict

def get_data(PATH_TO_FILE, marker):


    with open(PATH_TO_FILE, 'r') as f:
        text = f.read().replace('\n', " ")
        lines = re.split(marker, text)
        lines.pop(0)
    return lines


def get_id(data):
    entries = re.split(re.compile('\.[T,X]'), data)
    return  entries[0].strip()

def get_cross_references(data):
    entries = re.split(re.compile('\.[T,N]'), data)
    if len(entries) == 3:
        return entries[2]

def get_enter_info(data):
    entries = re.split(re.compile('\.[T,N]'), data)
    if len(entries) == 3:
        return entries[2]


def get_authors(data):
    entries = re.split(re.compile('\.[T,A]'), data)
    if len(entries) == 3:
        return entries[2]

def get_publicationDate(data):
    entries = re.split(re.compile('\.[T,B]'), data)
    if len(entries) == 3:
        return entries[-1]


def get_abstract(data):
    entries = re.split(re.compile('\.[T,W]'), data)
    if len(entries) == 3:
        return entries[-1]





def get_data_structerd_dataset(PATH_TO_CRAN_TXT, ID_marker):
    txt_list = get_data(PATH_TO_CRAN_TXT, ID_marker)
    txt_data = defaultdict(dict)
    for line in txt_list:
        id = get_id(line)
        txt_data[id]["id"] = id
        txt_data[id]["cross_references"] = get_cross_references(line)
        txt_data[id]["enter_info"] = get_enter_info(re.split(re.compile('\.[X]'), line)[0])
        txt_data[id]["authors"] = get_authors(re.split(re.compile('\.[X,N]'), line)[0])
        txt_data[id]["publicationDate"] = get_publicationDate(re.split(re.compile('\.[X,N,A]'), line)[0])
        txt_data[id]["abstract"] = get_abstract(re.split(re.compile('\.[X,N,A,B]'), line)[0])
        txt_data[id]["title"] = re.split(re.compile('\.[X,N,A,B,W]'), line)[0].replace(".T", '')

    return txt_data








import numpy
import numpy as np


def scoreRecall(real, expected):
    result = []
    intersect = []
    for i in range(len(real)):
        for val in real[i]:
            if val in expected[i]:
                intersect.append(val)
        recall = len(intersect) / len(real[i])
        result.append(recall)
    return result


def scorePrecision(real, expected):
    result = []

    for i in range(len(real)):
        intersect = []
        for val in real[i]:
            if val in expected[i]:
                intersect.append(val)
        if(len(expected[i]) != 0):
            precision = len(intersect) / len(expected[i])
        else:
            precision = 0
        result.append(precision)
    return result




def scorePrecision_rank(ranks, real, expected):
    result = []
    for i in range(len(real)):
        predicted_rank = [expected[i][j] for j in range(len(expected[i])) if j <= ranks[i]]
        intersect = [val for val in real[i] if val in predicted_rank]
        print(intersect)
        if(len(predicted_rank) != 0 ):
            precision = len(intersect) / len(predicted_rank)
        else:
            precision = 0
        result.append(precision)
        total = np.sum(result) / len(result)
        print("total", total)
    return total




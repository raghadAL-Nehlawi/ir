import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ir_wed/data/api/api.dart';

import '../utils/utils.dart';
import 'api/methods.dart';
import 'api/urls.dart';

class SearchProvider {
  Future<Either<QueryCorrection,List<SearchResult>>> search(String query)async{

    Map<String, dynamic> data = {
      "query" : query,

    };
    print(data);
    Options options = Utils.getOptions(accept: true, contentType: true);
    ApiResult result = await  Methods.post(url: URLS.SEARCH,options: options , data:data );
    if(result.type == ApiResultType.success)
      {
        List<SearchResult> res = result.data == [] ? <SearchResult>[]
            : List<SearchResult>.from(result.data.map((x) => SearchResult.fromJson(x)));
        return Right(res);
      }
    else
      {
        QueryCorrection correction = QueryCorrection(trueQuery: result.data);
        return Left(correction);
      }
  }
}



class SearchResult{
  String? body;
  String? title;
  bool? isOkay;
  String? queryBody;

  SearchResult({this.body, this.title, this.isOkay, this.queryBody});
  factory SearchResult.fromJson(json) => SearchResult(
    body: json["body"],
    title: json["title"],
  );
}

class QueryCorrection{
  String? trueQuery;
  QueryCorrection({this.trueQuery});

}

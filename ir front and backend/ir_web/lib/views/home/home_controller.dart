import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ir_wed/data/search_provider.dart';


class HomeController extends GetxController{
  TextEditingController searchController = TextEditingController();
  RxList<SearchResult> result = <SearchResult>[].obs;
  Rx<QueryCorrection> query = QueryCorrection().obs;


  search()async{
    SearchProvider searchProvider = SearchProvider();
    Either<QueryCorrection,List<SearchResult>> data = await searchProvider.search(searchController.text);
    if(data.isRight())
      result.addAll(data.getOrElse(() => []));
    result.fold(
            (_, l) => print("left" + l.toString()), //query.value = l,

            (rr, r) => print(rr.toString() + r.toString())// result.addAll(data.getOrElse(() => []))
    );

  }

@override
  onInit() async {


}


}
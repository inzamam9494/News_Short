import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:news_short/Services/utilities/appUrl.dart';

import '../../Model/model.dart';
import 'package:http/http.dart' as http;

import '../../Model/news_category.dart';

class StateService{
  Future<NewsQueryModel> fetchNewsArticles() async{
    final response = await http.get(Uri.parse(AppUrl.baseUrl));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return NewsQueryModel.fromJson(data);
    }
    else{
      throw Exception('Error 404');
    }
  }

  Future<NewsCategory> fetchNewsCategoryApi(String category) async{
    final response = await http.get(Uri.parse("https://newsapi.org/v2/everything?q=$category&apiKey=9a316991d02c4794ad7d35e42ccf8d67"));
    if(response.statusCode == 200){
      if (kDebugMode) {
        print(response.body);
      }
      var data = jsonDecode(response.body);
      return NewsCategory.fromJson(data);
    }else{
      throw Exception('Error 404');
    }
  }




}

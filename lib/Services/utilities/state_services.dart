import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:news_short/Services/utilities/appUrl.dart';

import '../../Model/model.dart';
import 'package:http/http.dart' as http;

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

  Future<List<Map<String, dynamic>>> newsArticlesApi() async{
    final response = await http.get(Uri.parse(AppUrl.baseUrl));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      final dataList = data['data']['articles'];
      return dataList.cast<Map<String, dynamic>>();
    }
    else{
      throw Exception("404 : Error");
    }
  }
}

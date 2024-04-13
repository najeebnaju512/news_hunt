import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_now/model/news_model.dart';
import 'package:http/http.dart' as http;

class SearchSreenController with ChangeNotifier {
   NewsDataModel? newsDataModel;
  bool isLoading = false;

  Future<void> searchData({required String searchText}) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$searchText&from=2024-03-06&sortBy=popularity&apiKey=233c06f8ee1b4faf9aba34353b5e73c7");
    try {
      final response =
          await http.get(url, headers: {'Content-type': 'application/json'});
      print("${response.statusCode} search");
      Map<String, dynamic> decodedData = {};
      if (response.statusCode == 200) {
        decodedData = jsonDecode(response.body);
        newsDataModel = NewsDataModel.fromJson(decodedData);
      } else {
        print("search Api Failed");
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

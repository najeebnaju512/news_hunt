import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_now/model/news_model.dart';

class CategoryController with ChangeNotifier {
  List<String> categoryList = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Sports",
    "Technology",
  ];
  String catagory = "business";
  onTap({required int index}) {
    catagory = categoryList[index].toLowerCase();
    fethchData();
    // print("$catagory is selected");
    notifyListeners();
  }

  late NewsDataModel newsDataModel;
  bool isLoading = false;

  fethchData() async {
    isLoading = true;
    notifyListeners();
    // print("$catagory is selected");
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$catagory&apiKey=233c06f8ee1b4faf9aba34353b5e73c7");

    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {};
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      print("api failed");
    }
    newsDataModel = NewsDataModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }
}

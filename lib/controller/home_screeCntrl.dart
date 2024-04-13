import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';


import '../model/news_model.dart';

class HomeScreenController with ChangeNotifier {
  late NewsDataModel newsModel;
  bool isLoading = false;
  //var baseUrl = "https://newsapi.org/";

  fetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("https://newsapi.org/v2/top-headlines?country=in&apiKey=233c06f8ee1b4faf9aba34353b5e73c7");
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {}; // map for storing response body
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      print("Api failed");
    }
    newsModel = NewsDataModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }

  void shareText({ String textToShare=""}) {
     try {
      Share.share(textToShare);
    } catch (e) {
      print('Error sharing: $e');
    }
    notifyListeners();
  }
  }


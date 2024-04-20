import 'package:flutter/material.dart';

import '../view/Catogory/catogary_page.dart';
import '../view/Homepage/home_page.dart';
import '../view/Search/search_page.dart';

class BottomNavController with ChangeNotifier {
  int selectedIndex = 0;

  void onItemTap(index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> mypages = [HomePage(), CategoryScreen(), SearchPage()];
}

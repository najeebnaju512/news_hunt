import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/bottom_nav_cntrl.dart';
import 'controller/catogary_cntrl.dart';
import 'controller/home_screeCntrl.dart';
import 'controller/search_screenCntrl.dart';
import 'view/bottom_nav.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchSreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryController(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.grey,
            appBarTheme: AppBarTheme(backgroundColor: Colors.blueGrey[200])),
        debugShowCheckedModeBanner: false,
        home: BottomNavScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../controller/bottom_nav_cntrl.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<BottomNavController>(context)
          .mypages[Provider.of<BottomNavController>(context).selectedIndex],
      bottomNavigationBar: Container(
        // color: Colors.transparent,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: Provider.of<BottomNavController>(context).selectedIndex,
          onTap: Provider.of<BottomNavController>(context, listen: false)
              .onItemTap,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined), label: "Catogory"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search")
          ],
          backgroundColor: Colors.black54,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.red,
          showSelectedLabels: true,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}

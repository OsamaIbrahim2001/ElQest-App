import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../Provider/widget_provider.dart';
import '../../Screens/categories.dart';
import '../../Screens/main_screen.dart';
import '../../Screens/product_screen.dart';
import '../../Screens/settingScreen.dart';

class BuildBottomNavigationBar extends StatelessWidget {
  List pages = [
    {'title': 'العملاء', 'page': MainScreen()},
    {'title': 'الاصناف', 'page': Categories()},
    {'title': 'المنتجات', 'page': ProductScreen()},
    {'title': 'الاعدادات', 'page': const SettingScreen()}
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WidgetProvider>(context, listen: true);
    return Scaffold(
      body: pages[provider.currentIndex]['page'],
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: BottomNavigationBar(
          onTap: (index) {
            provider.changeIndex(index);
          },
          currentIndex: provider.currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "العملاء"),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.production_quantity_limits,
              ),
              label: "الاصناف",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.apps,
              ),
              label: "المنتجات",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.read_more_outlined,
              ),
              label: "المزيد",
            )
          ],
        ),
      ),
    );
  }
}

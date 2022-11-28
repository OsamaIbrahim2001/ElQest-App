import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



import 'Models/db_clients.dart';
import 'Provider/add_image_provider.dart';
import 'Provider/db_provider.dart';
import 'Provider/text_provider.dart';
import 'Provider/widget_provider.dart';
import 'Theme/theme.dart';
import 'Widgets/MainClients/bottom_navigation.dart';

class MainPremiumApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClientsProvider>(create: (context) => ClientsProvider()),
        ChangeNotifierProvider<DBProvider>(create: (context) => DBProvider()..getClientData()..getCategory()..getProducts()),
        ChangeNotifierProvider<TextProvider>(create: (context) => TextProvider()),
        ChangeNotifierProvider<WidgetProvider>(create: (context) => WidgetProvider()),
        ChangeNotifierProvider<AddImageProvider>(create: (context) => AddImageProvider()),
      ],
      child:MainPremiumAppHomePage(),
    );
  }
}

class MainPremiumAppHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BuildBottomNavigationBar(),
      theme: lightThemeData
    );
  }
}

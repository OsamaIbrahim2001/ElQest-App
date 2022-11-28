import 'package:flutter/material.dart';


import '../Widgets/MainClients/main_appbar.dart';
import '../Widgets/MainClients/main_clients.dart';
import 'add_client.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: builAppBar( title: 'العملاء', ctx: context,condition: 'main'),
        body: MainClients(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => AddClients()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

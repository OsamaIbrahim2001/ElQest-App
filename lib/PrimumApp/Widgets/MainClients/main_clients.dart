import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../Contents/Widget/TextField.dart';
import '../../Contents/Widget/contents.dart';
import '../../Provider/db_provider.dart';
import '../../Provider/edit_data.dart';
import '../../Provider/widget_provider.dart';

import '../../Screens/edit_client.dart';
import '../../Screens/user_screen.dart';

import '../../Theme/theme.dart';
import '../build_dismissible.dart';

class MainClients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<DBProvider>(context, listen: true);
    final widgetProvider = Provider.of<WidgetProvider>(context, listen: false);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: dbProvider.clientsList.isEmpty
            ? ListEmpty("من فضلك أضف عملاء")
            : ListView.separated(
                itemBuilder: (context, index) => Card(
                      elevation: 5,
                      child: buildDismissible(
                        edit: () {
                          dbProvider
                              .getClientDataByClientId(
                                  dbProvider.clientsList[index].id!)
                              .then((value) {
                            editClient(context);
                            pushNavigate(context, EditClients());
                          });
                        },
                        delete: () {
                          dbProvider
                              .deleteClient(
                                  clientId: dbProvider.clientsList[index].id!,
                                  index: index)
                              .then((value) {

                            Navigator.of(context).pop();
                          });
                        },
                        context: context,
                        key: dbProvider.clientsList[index].id.toString(),
                        child: ListTile(
                          onTap: () {
                            dbProvider.resetElQestProducts();
                            dbProvider
                                .getClientDataByClientId(
                                    dbProvider.clientsList[index].id!)
                                .then((value) {
                              dbProvider
                                  .getElqestClients(
                                      dbProvider.clientsList[index].id!)
                                  .then((value) {
                                dbProvider.getElqestProductsList();
                              });
                              pushNavigate(context, UserScreen());
                            });
                          },
                          title: Text(
                            dbProvider.clientsList[index].name,
                            style: lightThemeData.textTheme.bodyText1,
                          ),
                          subtitle: Text(
                            dbProvider.clientsList[index].nid,
                            style: lightThemeData.textTheme.subtitle1!.copyWith(
                                fontFamily: 'Monadi',
                                fontSize: 15,
                                color: Colors.black54),
                          ),
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xffcde0c9),
                                      Color(0xff6bb2a0),
                                      Color(0xffffffff),
                                      Color(0xffedecde),
                                      Color(0xffcde0c9),
                                      Color(0xff6bb2a0),
                                      Color(0xff2c6975)
                                    ]),
                                shape: BoxShape.circle),
                            child: Center(
                                child: Text(
                              "${index + 1}",
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => const Divider(
                      height: 5,
                      color: Colors.blue,
                      thickness: 1,
                    ),
                itemCount: dbProvider.clientsList.length),
      ),
    );
  }
}

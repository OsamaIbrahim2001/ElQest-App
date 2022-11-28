import 'package:flutter/material.dart';

import 'Screens/edit_client.dart';




BuildDismissible(
    {required String key,
    required Widget child,
    required BuildContext context}) {
  return Dismissible(
    key: Key(key),
    child: child,
    background: container(true),
    secondaryBackground: container(false),
    onDismissed: (DismissDirection direction) {
      if (direction == DismissDirection.startToEnd) {
        print('deleted');
      } else {
      }
    },
    confirmDismiss: (DismissDirection direction) {
      if (direction == DismissDirection.startToEnd) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  content: const Text("Are you sure to delete this item"),
                  actions: [
                    TextButton(
                        onPressed: ()=> Navigator.of(context).pop(true),
                        child: const Text(
                          "ok",
                          style: TextStyle(color: Colors.red),
                        )),
                    TextButton(
                        onPressed: ()=> Navigator.of(context).pop(),
                        child: const Text(
                          "cancel",
                        ))
                  ],
                ));
      }
      else{
        return Navigator.of(context).push(MaterialPageRoute(builder: (context)=> EditClients()));
      }
    },
  );
}

Container container(bool left) {
  return Container(
    color: left ? Colors.redAccent : Colors.greenAccent,
    padding: EdgeInsets.only(right: left ? 30 : 0, left: left ? 0 : 30),
    child: Row(
      mainAxisAlignment: left ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Text(
          left ? "حــذف" : 'تعديل',
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w900, color: Colors.white),
        ),
        const SizedBox(
          width: 20,
        ),
        Icon(
          left ? Icons.delete_forever : Icons.edit,
          color: Colors.white,
        )
      ],
    ),
  );
}

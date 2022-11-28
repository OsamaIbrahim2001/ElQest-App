import 'package:flutter/material.dart';

import 'ElQest/delete_qest.dart';



Dismissible buildDismissible(
    {required String key,
    required Widget child,
    required Function delete,
    required Function edit,
    required BuildContext context}) {

  return Dismissible(
    key: Key(key),
    child: child,
    background: container(true),
    secondaryBackground: container(false),
    confirmDismiss: (DismissDirection direction) async {
      if (direction == DismissDirection.startToEnd) {
        showDialog(
            context: context,
            builder: (ctx) => dialogDelete(
                title: 'هل تريد حذف هذا العميل',
                context: context,
                function: () => delete()));
      } else {
        edit();
      }
      return false;
    },
  );
}

Container container(bool left) {
  return Container(
    color: left ? Colors.redAccent : Colors.green,
    padding: EdgeInsets.only(right: left ? 30 : 0, left: left ? 0 : 30),
    child: Row(
      mainAxisAlignment: left ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Text(
          left ? "حــذف" : 'تعديل',
          style: const TextStyle(
              fontSize: 17, color: Colors.white, fontFamily: 'Monadi'),
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

import 'package:flutter/material.dart';


AlertDialog dialogDelete({required String title,required BuildContext context,required VoidCallback function}){

  return AlertDialog(
    title: Row(
      children:  [
        const Icon(Icons.delete,color: Colors.red,),
        const Spacer(),
        Text(
          title,
          style: const TextStyle(
              fontSize: 15, fontFamily: "Monadi"),
        ),
      ],
    ),
    actions: [
      TextButton(
          onPressed: function,
          child: const Text(
            "حذف",
            style: TextStyle(
                fontSize: 16,
                fontFamily: "Monadi",
                color: Colors.red),
          )),
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "الغاء",
            style: TextStyle(
                fontSize: 16, fontFamily: "Monadi"),
          ))
    ],
  );
}
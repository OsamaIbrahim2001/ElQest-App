
import 'package:flutter/material.dart';

buildFilterButton(){
  return OutlinedButton.icon(
    onPressed: () {},
    icon: const Icon(
      Icons.filter_alt_rounded,
      color: Colors.grey,
    ),
    label: const Text("فلتر",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
  );
}
import 'package:flutter/material.dart';

class DropdownRow extends StatelessWidget {
  const DropdownRow({
    Key? key,
    required this.dSize,
    required this.category,
    required this.categories,
    required this.onChange,
  required this.txt
  }) : super(key: key);

  final Size dSize;
  final String txt;
  final String? category;
  final List<String> categories;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dSize.width,
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.blue, width: 2
          ),
          borderRadius: BorderRadius.circular(
              10)
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(

          hint:  Text(txt,style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 23),),
          isExpanded: true,
          value: category,
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.blue),
          items: categories.map((String cat) {
            return DropdownMenuItem<String>(
              value: cat,
              child: Text(cat,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
            );
          }).toList(),
          onChanged: (String? newValue) {
            onChange(newValue);
          },
        ),
      ),
    );
  }
}
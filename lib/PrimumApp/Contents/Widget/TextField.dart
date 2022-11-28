import 'package:flutter/material.dart';

TextFormField buildTextField({
  required TextEditingController controller,
   String text='',
   IconData icon=Icons.add,
  TextInputType keyboard = TextInputType.text,
  int maxLength = 100,
  VoidCallback? function,
  bool enabled=true
}) {
  return TextFormField(
    enabled: enabled,
    onTap: function,
    style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
    maxLength: maxLength,
    controller: controller,
    keyboardType: keyboard,
    decoration: InputDecoration(
      label: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
        prefixIcon: Icon(icon),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color:Colors.blue,width: 2.0),
          borderRadius: BorderRadius.circular(15)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2.0,color: Colors.blue),
          borderRadius: BorderRadius.circular(15)),
    ),
    validator: (val) {
      if (val!.isEmpty) {
        return ' اكتب $text';
      }
    },
  );
}

Center ListEmpty(String txt){
  return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.menu,
            color: Colors.grey,
            size: 50,
          ),
          Text(txt,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),)
        ],
      ));
}

ElevatedButton buildElevatedButton({required VoidCallback onPressed,required String text,required IconData icon}) {
  return ElevatedButton.icon(
    onPressed: onPressed,
    label: Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 8.0, horizontal: 20),
      child:  Text(
        text,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold,fontFamily: 'Monadi'),
      ),
    ),
    icon: Icon(icon),
  );
}

Widget buildRowIndicator(int indexIndicator, int length) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
        length,
            (index) => Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            Container(
              height: 6,
              width: index == indexIndicator ? 25 : 6,
              decoration: BoxDecoration(
                  color:
                  index == indexIndicator ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ],
        )),
  );
}
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

class AddImageProvider with ChangeNotifier {


  List<File> imageFile=[];
  bool picked=false;
  String imageCompressed='';
  List<String> listImageCompressed=[];

  void changePicked(bool val){
    picked=val;
    notifyListeners();
  }


  void imageStored(String image) {}

  Future pickImage() async {
    imageFile=[];
    changePicked(true);
    final imagePick = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagePick == null) return;
    imageFile.add(File(imagePick.path));
    final Uint8List? bytes = await compressImage(imageFile[0]);
    imageCompressed = base64Encode(bytes!);
    notifyListeners();
  }

  Future<Uint8List?> compressImage(File file) async {
    var result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      minWidth: 2300,
      minHeight: 1500,
      quality: 94,
    );
    print('before: ${file.lengthSync()}');
    print('after: ${result?.lengthInBytes}');
    return result;
  }

  Future pickMultiImage() async {
    changePicked(true);
    final imagePick = await ImagePicker().pickMultiImage();
    if (imagePick == null) return;
    for(int i=0;i<imagePick.length;i++){
      imageFile.add(File(imagePick[i].path));
      final Uint8List? bytes = await compressImage(imageFile[i]);
      listImageCompressed.add(base64Encode(bytes!));
    }
    notifyListeners();
  }
  void removeImageFromList(File val)async{
    final Uint8List? bytes = await compressImage(val);
    imageCompressed = base64Encode(bytes!);
    imageFile.remove(val);
    listImageCompressed.remove(imageCompressed);
    notifyListeners();
  }
  void resetData(){
    imageCompressed='';
    imageFile=[];
    listImageCompressed=[];
  }
}






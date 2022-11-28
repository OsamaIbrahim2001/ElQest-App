import 'package:flutter/material.dart';

pushNavigate( BuildContext context, Widget child){
  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>child));
}
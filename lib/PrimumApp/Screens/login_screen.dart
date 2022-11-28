import 'dart:math';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVissible=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Transform.rotate(
            angle: -25 * (pi / 180),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  color: Color(0xFFE06C78),
                  borderRadius: BorderRadius.circular(30)),
              height: MediaQuery.of(context).size.height * .12,
              width: double.infinity,
              child: Text("El Farouk",
                  style: TextStyle(
                      fontSize: 55,
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center),
            ),
          ),
          SizedBox(height: 100),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 15),
            elevation: 10,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              padding: EdgeInsets.all(16),
              height: 290,
              child: Form(
                //key: _formkey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'E-Mail ', hintText: 'email@gmail.com'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          if (val!.isEmpty || !val.contains('@')) {
                            return "Invalid Email";
                          }
                          return null;
                        },
                        onSaved: (val) {},
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(icon: isVissible?Icon(Icons.visibility,):Icon(Icons.visibility_off),onPressed: (){
                            setState(() {
                              isVissible=!isVissible;
                            });
                          },)
                        ),
                        //controller: _passwordContoller,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isVissible,
                        validator: (val) {
                          if (val!.isEmpty || val.length < 8) {
                            return "This password is very short";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Column Colors() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildContainer(Color(0xFF5874DC)),
        SizedBox(height: 20),
        buildContainer(Color(0xFFE06C78)),
        SizedBox(height: 20),
        buildContainer(Color(0xFFFA9284)),
        SizedBox(height: 20),
        buildContainer(Color(0xFF6AAB9C)),
        SizedBox(height: 20),
        buildContainer(Color(0xFFFFFFFF)),
      ],
    );
  }

  Container buildContainer(Color color) {
    return Container(
      height: 100,
      width: 200,
      color: color,
    );
  }
}

// Card(
// margin: EdgeInsets.symmetric(horizontal: 15),
// elevation: 10,
// child: AnimatedContainer(
// duration: Duration(milliseconds: 300),
// padding: EdgeInsets.all(16),
// height: _authMode==AuthMode.SignUp?350:290,
// child: Form(
// key: _formkey,
// child: SingleChildScrollView(
// child: Column(
// children: [
// TextFormField(
// decoration: InputDecoration(labelText: 'E-Mail ',hintText: 'email@gmail.com'),
// keyboardType: TextInputType.emailAddress,
// validator: (val) {
// if (val!.isEmpty || !val.contains('@')) {
// return "Invalid Email";
// }
// return null;
// },
// onSaved: (val) {
// _authData['email'] = val!;
// print(_authData['email']);
// },
// ),
// TextFormField(
// decoration: InputDecoration(labelText: 'Password',),
// controller: _passwordContoller,
// keyboardType: TextInputType.visiblePassword,
// obscureText: true,
// validator: (val) {
// if (val!.isEmpty || val.length<8) {
// return "This password is very short";
// }
// return null;
// },
// onSaved: (val) {
// _authData['password'] = val!;
// print(_authData['password']);
// },
// ),
//
// AnimatedContainer(
// duration: Duration(milliseconds: 300),
// constraints: BoxConstraints(
// minHeight: _authMode==AuthMode.SignUp?60:0,
// maxHeight: _authMode==AuthMode.SignUp?120:0
// ),
// child: FadeTransition(
// opacity:_opacityAnimation! ,
// child: TextFormField(
// enabled:_authMode==AuthMode.SignUp ,
// decoration: InputDecoration(labelText: "Confirm Password",),
// keyboardType: TextInputType.visiblePassword,
// obscureText: true,
// validator: _authMode==AuthMode.SignUp?(val) {
// if (val!=_passwordContoller.text) {
// return "Passwords don't match";
// }
// return null;
// }:null,
// ),
// ),
// ),
// SizedBox(height: 20,),
// RaisedButton(
// padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(20)),
// onPressed: submite,
// color: Theme.of(context).primaryColor,
// textColor: Theme.of(context).primaryTextTheme.button?.color,
// child: Text(_authMode == AuthMode.Login ? "LOGIN" : "SIGN UP"),
// ),
// FlatButton(
// textColor: Theme.of(context).primaryColor,
// padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
// onPressed: _switchAuthMode,
// child: Text(
// '${_authMode != AuthMode.Login ? "LOGIN" : "SIGNUP"} INSTEAD'),
// )
// ],
// ),
// ),
// ),
// ),
// ),

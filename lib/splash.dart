import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:status_pay_app/login.dart';
import 'package:status_pay_app/navigation/bottom_navigation.dart';
import 'package:status_pay_app/onboarding.dart';
import 'package:status_pay_app/otp.dart';
import 'package:status_pay_app/shared_Prefrences.dart';

import 'Model/user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  final Color backgroundColor = Colors.white;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{


  @override
  void initState(){
    super.initState();
    _loadWidget();
  }

  _loadWidget()async{
    var _duration = Duration(seconds: 4);
    return Timer(_duration, navigationPage);
    //await Future.delayed(Duration(seconds: 2), (){});
    //Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>MyHomePage(title: 'Status Pay',)));
  }

  void navigationPage() {
    SharedPref sp = new SharedPref();
    sp.getFirst().then((value) {
      print("is first $value");
      if(!value){
        print("is first $value");
        sp.getLoggedIn().then((value) {
          print("is first $value");
          if (value)
            {
              sp.getUserData().then((value) {
                Iterable blog = json.decode(value);
                var users=blog.map((blog) => new User.fromJson(blog)).toList();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => BottomBar(users[0], users[0].id, true)));
              });
            }
          else
            {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
            }
        });
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => OnBoardingScreen()));
      }
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //height: MediaQuery.of(context).size.height,
              height: 400,
              width: 400,
              //color: Colors.green,
              child: Image.asset('assets/images/icon.png', fit: BoxFit.cover,),
            ),
          ],
        ),
      ),
    );
  }
}

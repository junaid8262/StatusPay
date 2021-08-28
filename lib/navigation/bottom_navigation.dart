import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:status_pay_app/Model/user.dart';
import 'package:status_pay_app/bottom_nav_screens/earning.dart';
import 'package:status_pay_app/bottom_nav_screens/home.dart';
import 'package:status_pay_app/bottom_nav_screens/profile.dart';
import 'package:status_pay_app/bottom_nav_screens/referral.dart';
import 'package:status_pay_app/bottom_nav_screens/setting.dart';

class BottomBar extends StatefulWidget {
  String uid;
  User user ;
  bool isLogin;

  BottomBar(this.user,this.uid,this.isLogin);

  @override
  _BottomNavigationState createState() => new _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomBar>{

  int _currentIndex = 2;

  List<Widget> _children=[];

  @override
  void initState() {
    super.initState();
    _children = [
      Profile(widget.user),
      Earning(widget.uid),
      Home(widget.user),
      Referral(widget.uid),
      Setting(widget.uid),
    ];
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }




  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //backgroundColor: Colors.grey[700],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[700],
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blueAccent,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.person),
              title: Text("Profile")
          ),
          BottomNavigationBarItem(
              icon: new Icon(CupertinoIcons.money_dollar_circle),
              title: Text("Earning")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Referral")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("Setting")
          ),
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:status_pay_app/Model/user.dart';

class Profile extends StatefulWidget {
  User user ;

  Profile(this.user);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blueAccent.shade700,
        appBar: AppBar(
          elevation: 4,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset('assets/images/status_pay_app_bar.png',height: 40,),
        ),
      body: SafeArea(
       // / minimum: EdgeInsets.only(top: 20),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10.0,
              sigmaY: 10.0,
            ),
            child: Container(
              color: Colors.blue.shade800 ,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            //top header
                            Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SizedBox(height: 20,),
                                    Text(
                                      "Profile",
                                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 100,
                                      width: MediaQuery.of(context).size.width,
                                      //width: 200,
                                      child: Divider(
                                        color: Colors.grey[600],
                                      ),
                                    )
                                  ],
                                )
                            ),
                            Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50),bottomRight: Radius.zero,bottomLeft: Radius.zero ),
                                    color: Colors.blueAccent.withOpacity(0.5),

                                  ),
                                  //padding: EdgeInsets.symmetric(horizontal: 20),
                                  alignment: Alignment.center,
                                  //profile info
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 20,),
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundImage: AssetImage('assets/images/profile.png'),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        widget.user.userName,
                                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        widget.user.email,
                                        style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),

                                    ],
                                  ),
                                )
                            ),

                          ]
                      )
                  ),
                ],
              ),

            ),
          ),
        ),
      )
    );
  }
}

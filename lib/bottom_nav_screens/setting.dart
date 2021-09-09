import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:status_pay_app/login.dart';
import 'package:status_pay_app/shared_Prefrences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Setting extends StatefulWidget {
  String uid;

  Setting(this.uid);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {


  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 4,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset('assets/images/status_pay_app_bar.png',height: 40,),
        ),
        body: SafeArea(
          minimum: EdgeInsets.only(top: 20),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
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
                                  Text(
                                    "Setting",
                                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width,
                                    //width: 200,
                                    child: Divider(
                                      color: Colors.grey[600],
                                    ),
                                  )
                                ],
                              )
                          ),
                          //main content
                          Expanded(
                              child: Container(
                                //padding: EdgeInsets.symmetric(horizontal: 10),
                                //alignment: Alignment.center,
                                //profile info
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10,),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder:(context)=>  SafeArea(
                                            child: WebView(
                                                key: _key,
                                                javascriptMode: JavascriptMode.unrestricted,
                                                initialUrl: "https://statuspay.net/t-c/"),
                                          )));

                                          //action
                                          //Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>SignUpScreen()));
                                        },
                                        child: Text("Terms and Conditions", style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      )
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder:(context)=>  SafeArea(
                                            child: WebView(
                                                key: _key,
                                                javascriptMode: JavascriptMode.unrestricted,
                                                initialUrl: "https://statuspay.net/privacy-policy/"),
                                          )));

                                          //action
                                          //Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>SignUpScreen()));
                                        },
                                        child: Text("Privacy Policy", style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          ),
                                        )
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder:(context)=>  SafeArea(
                                            child: WebView(
                                                key: _key,
                                                javascriptMode: JavascriptMode.unrestricted,
                                                initialUrl: "https://statuspay.net/publisher/"),
                                          )));

                                          //action
                                          //Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>SignUpScreen()));
                                        },
                                        child: Text("Publisher", style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          ),
                                        )
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder:(context)=>  SafeArea(
                                            child: WebView(
                                                key: _key,
                                                javascriptMode: JavascriptMode.unrestricted,
                                                initialUrl: "https://statuspay.net/advertiser/"),
                                          )));

                                          //action
                                          //Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>SignUpScreen()));
                                        },
                                        child: Text("Advertisers", style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          ),
                                        )
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder:(context)=>  SafeArea(
                                            child: WebView(
                                                key: _key,
                                                javascriptMode: JavascriptMode.unrestricted,
                                                initialUrl: "https://statuspay.net/how-it-works/"),
                                          )));

                                          //action
                                          //Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>SignUpScreen()));
                                        },
                                        child: Text("How it Works", style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          ),
                                        )
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder:(context)=>  SafeArea(
                                            child: WebView(
                                                key: _key,
                                                javascriptMode: JavascriptMode.unrestricted,
                                                initialUrl: "https://statuspay.net/agents/"),
                                          )));

                                          //action
                                          //Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>SignUpScreen()));
                                        },
                                        child: Text("Agents", style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          ),
                                        )
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          //action
                                          SharedPref pf = SharedPref();
                                          pf.setLoggedIn(false);
                                          signOut().whenComplete(() =>Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>LoginScreen())) );
                                        },
                                        child: Text("Log Out", style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          ),
                                        )
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width,
                                      //width: 200,
                                      child: Divider(
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    SizedBox(height: 10,),
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
        )
    );
  }
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

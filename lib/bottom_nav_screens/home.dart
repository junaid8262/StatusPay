import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:status_pay_app/Model/user.dart';
import 'package:status_pay_app/submit_screenshot.dart';

class Home extends StatefulWidget {
  User user ;

  Home(this.user);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset('assets/images/status_pay_app_bar.png',height: 40,),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.maxFinite,
            color: Colors.white,
          ),
          SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10),
              children: [
                //user info
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(5),
                  //profile detail row
                  child: Row(
                    children: [
                      Expanded(
                        flex:2,
                        child: Container(
                          //width: 30,
                          //height: 30,
                          child: Image.asset("assets/images/profile.png", fit: BoxFit.cover,),
                        )
                      ),
                      Expanded(
                        flex:8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome to StatusPay",
                              style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 4,),
                            Text(
                              widget.user.userName,
                              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: Colors.black),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //ad
                Container(
                  //margin: EdgeInsets.all(15),
                  //padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Please download the following Advert",
                        style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: Image.asset('assets/images/ad.jpg', fit: BoxFit.cover,),
                      ),
                      //Icon(Icons.arrow_forward,color: Colors.blueAccent,)
                    ],
                  ),
                ),
                //heading
                Container(
                  //margin: EdgeInsets.all(15),
                  //padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "And copy the following text",
                        style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                      //Icon(Icons.arrow_forward,color: Colors.blueAccent,)
                    ],
                  ),
                ),
                //text detail box
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        flex:8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kantipur TV",
                              style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 4,),
                            Text(
                              "For the first time, experience Live Kantipur TV experience in HD on your mobile phones with this App. This App is available for botn Android and IOS devices.",
                              style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700,color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "Download the App and enjoy Kantipur TV in HD on your devices.",
                              style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700,color: Colors.black),
                              textAlign: TextAlign.left,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 2, style: BorderStyle.solid),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                //button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    child: MaterialButton(
                      //minWidth: double.infinity,
                      //height: 50,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>SubmitScreenshotScreen()));
                      },
                      color: Colors.blueAccent,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: Text(
                        "Submit", style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                //statusPay earning detail
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.zero,topRight: Radius.circular(130),bottomLeft: Radius.zero , bottomRight: Radius.zero),
                    color: Colors.blueAccent,

                  ),
                  //margin: EdgeInsets.all(15),
                  //padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15,),
                      Center(
                        child: Text(
                          "How to earn with StatusPay",
                          style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),
                          //textAlign: TextAlign.center,
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.white,
                        endIndent: 60,
                        indent: 60,
                      ),

                      SizedBox(height: 15,),

                      Text(
                        "1- Download the above Advert.",
                        style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),
                        //textAlign: TextAlign.start,
                      ),
                      Text(
                        "2- Upload the Advert as your WhatsApp status.",
                        style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),
                       // textAlign: TextAlign.start,
                      ),
                      Text(
                        "3- Copy the text of the Advert.",
                        style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),
                       // textAlign: TextAlign.start,
                      ),
                      Text(
                        "4- Upload the text as second WhatsApp status.",
                        style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "5- Wait for 20 Hours.",
                        style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "6-Take screenshot of both the Statuses the following day.",
                        style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "7- Submit the screenshots.",
                        style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "8- Your earning will be calculated and credited to your StatusPay account.",
                        style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 5,),

                    ],
                  ),
                ),
                SizedBox(height: 20,),

              ],
            ),
          )
        ],
      ),
    );
  }
}

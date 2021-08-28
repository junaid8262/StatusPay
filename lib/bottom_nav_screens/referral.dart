import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class Referral extends StatefulWidget {
  String uid;

  Referral(this.uid);

  @override
  _ReferralState createState() => _ReferralState();
}

class _ReferralState extends State<Referral> {



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
                                    "Referrals",
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
                          Expanded(
                              child: Container(
                                //padding: EdgeInsets.symmetric(horizontal: 10),
                                alignment: Alignment.center,
                                //profile info
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 10,),
                                    Text(
                                      "Refer a friend and receive cash rewards", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                      "Refer a friend and receive cash rewards upto &3 per referral. Share the link and ask to put your referral ID. Upon successful registration both of you will receive upto &3.", style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(height: 10,),
                                    //icon and text
                                    Container(
                                      //margin: EdgeInsets.all(10),
                                      //padding: EdgeInsets.all(4),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        /*children: const <Widget>[
                                          Icon(
                                            Icons.favorite,
                                            color: Colors.pink,
                                            size: 24.0,
                                            semanticLabel: 'Text to announce in accessibility modes',
                                          ),
                                          Icon(
                                            Icons.audiotrack,
                                            color: Colors.green,
                                            size: 30.0,
                                          ),
                                          Icon(
                                            Icons.beach_access,
                                            color: Colors.blue,
                                            size: 36.0,
                                          ),
                                        ],*/
                                        children: [
                                          Expanded(
                                            flex:3,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.copy,
                                                  color: Colors.black,
                                                  size: 30.0,
                                                ),
                                                SizedBox(height: 6,),
                                                Text(
                                                  "Copy Link",
                                                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: Colors.black),
                                                  textAlign: TextAlign.center,
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex:3,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.done,
                                                  color: Colors.black,
                                                  size: 30.0,
                                                ),
                                                SizedBox(height: 6,),
                                                Text(
                                                  "Friends Register Successfully",
                                                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: Colors.black),
                                                  textAlign: TextAlign.center,
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex:3,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.attach_money,
                                                  color: Colors.black,
                                                  size: 30.0,
                                                ),
                                                SizedBox(height: 6,),
                                                Text(
                                                  "Earn Cash Rewards",
                                                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: Colors.black),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),

                                    ),
                                    SizedBox(height: 20,),
                                    //button
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 80),
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(top: 3, left: 3),
                                        child: MaterialButton(
                                          minWidth: double.infinity,
                                          //height: 50,
                                          onPressed: () {
                                            shareCode(context);
                                            //navigationPage();
                                          },
                                          color: Colors.blueAccent,
                                          elevation: 8,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),

                                          ),
                                          child: Text(
                                            "2HD432", style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Text(
                                      "Share on Social", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 20,),
                                    //social media
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      padding: EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              padding: EdgeInsets.all(20),
                                              child: Image.asset('assets/images/fb.png', fit: BoxFit.cover,color: Colors.blueAccent,),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              padding: EdgeInsets.all(20),
                                              child: Image.asset('assets/images/twitter.png', fit: BoxFit.cover,color: Colors.blueAccent,),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              padding: EdgeInsets.all(20),
                                              child: Image.asset('assets/images/linkedin.png', fit: BoxFit.cover,color: Colors.blueAccent,),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              padding: EdgeInsets.all(20),
                                              child: Image.asset('assets/images/instagram.png', fit: BoxFit.cover,color: Colors.blueAccent,),
                                            ),
                                          ),
                                        ],
                                      ),

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
        )
    );
  }
  shareCode(BuildContext context) async {
    await Share.share("text");
  }

}

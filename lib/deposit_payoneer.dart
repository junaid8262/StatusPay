import 'package:flutter/material.dart';

import 'Model/Server.dart';

class PayoneerScreen extends StatefulWidget {

  @override
  _PayoneerScreenState createState() => new _PayoneerScreenState();
}

class _PayoneerScreenState extends State<PayoneerScreen> {
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
                                    "Deposit",
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
                                  ),
                                ],
                              )
                          ),
                          //blue box
                          Expanded(
                              child: Container(
                                //padding: EdgeInsets.symmetric(horizontal: 10),
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //deposit box
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.all(40),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            //flex:8,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                //withdraw detail
                                                Container(
                                                  //margin: EdgeInsets.all(15),
                                                  //padding: EdgeInsets.all(5),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                          flex:6,
                                                          child: Container(
                                                            //width: 30,
                                                            //height: 30,
                                                            child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Text(
                                                                    "Registration Fee:",
                                                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.white),
                                                                    textAlign: TextAlign.center,
                                                                  ),
                                                                  SizedBox(height: 5,),
                                                                ]
                                                            ),
                                                          )
                                                      ),
                                                      Expanded(
                                                        flex:4,
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              "5",
                                                              style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),
                                                              textAlign: TextAlign.center,
                                                            ),
                                                            SizedBox(height: 5,),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        //border: Border.all(color: Colors.black,width: 2, style: BorderStyle.solid),
                                        color: Colors.blueAccent,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    //withdraw box
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.all(20),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            //flex:8,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                //withdraw detail
                                                Container(
                                                  //margin: EdgeInsets.all(15),
                                                  //padding: EdgeInsets.all(5),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        //flex:5,
                                                          child: Container(
                                                            //width: 30,
                                                            //height: 30,
                                                            child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Text(
                                                                    "MasterCard",
                                                                    style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.white),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                  SizedBox(height: 40,),
                                                                  MaterialButton(
                                                                    minWidth: double.infinity,
                                                                    //height: 50,
                                                                    onPressed: () {
                                                                      //navigationPage();
                                                                    },
                                                                    color: Colors.white,
                                                                    elevation: 8,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(10),

                                                                    ),
                                                                    child: Text(
                                                                      "Card Holder", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.red[300],
                                                                    ),
                                                                      textAlign: TextAlign.center,
                                                                    ),
                                                                  ),
                                                                  SizedBox(height: 10,),
                                                                  MaterialButton(
                                                                    minWidth: double.infinity,
                                                                    //height: 50,
                                                                    onPressed: () {
                                                                      //navigationPage();
                                                                    },
                                                                    color: Colors.white,
                                                                    elevation: 8,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(10),

                                                                    ),
                                                                    child: Text(
                                                                      "Number", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.red[300],
                                                                    ),
                                                                      textAlign: TextAlign.center,
                                                                    ),
                                                                  ),
                                                                  SizedBox(height: 10,),
                                                                  Row(
                                                                    children: [
                                                                      Expanded(
                                                                          flex:5,
                                                                          child: Container(
                                                                            //width: 30,
                                                                            //height: 30,
                                                                            child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  MaterialButton(
                                                                                    minWidth: double.infinity,
                                                                                    //height: 50,
                                                                                    onPressed: () {
                                                                                      //navigationPage();
                                                                                    },
                                                                                    color: Colors.white,
                                                                                    elevation: 8,
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(10),

                                                                                    ),
                                                                                    child: Text(
                                                                                      "Expires", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.red[300],
                                                                                    ),
                                                                                      textAlign: TextAlign.center,
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(height: 5,),
                                                                                ]
                                                                            ),
                                                                          )
                                                                      ),
                                                                      SizedBox(width: 20,),
                                                                      Expanded(
                                                                        flex:5,
                                                                        child: Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                          children: [
                                                                            MaterialButton(
                                                                              minWidth: double.infinity,
                                                                              //height: 50,
                                                                              onPressed: () {
                                                                                //navigationPage();
                                                                              },
                                                                              color: Colors.white,
                                                                              elevation: 8,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(10),

                                                                              ),
                                                                              child: Text(
                                                                                "CVV", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.red[300],
                                                                              ),
                                                                                textAlign: TextAlign.center,
                                                                              ),
                                                                            ),
                                                                            SizedBox(height: 5,),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  SizedBox(height: 10,),
                                                                  //submit
                                                                  MaterialButton(
                                                                    //minWidth: double.infinity,
                                                                    //height: 50,
                                                                    onPressed: () async{
                                                                      //navigationPage();
                                                                      await StripeService.payWithNewCard(
                                                                          amount: '15000',
                                                                          currency: 'USD'
                                                                      );
                                                                    },
                                                                    color: Colors.white,
                                                                    elevation: 8,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(10),
                                                                    ),
                                                                    child: Text(
                                                                      "Submit", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black,
                                                                    ),
                                                                      textAlign: TextAlign.center,
                                                                    ),
                                                                  ),
                                                                ]
                                                            ),
                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        //border: Border.all(color: Colors.black,width: 2, style: BorderStyle.solid),
                                        color: Colors.red[300],
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          //red box
                        ]
                    )
                ),
              ],
            ),

          ),
        )
    );
  }

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }
}
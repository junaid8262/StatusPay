import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:status_pay_app/withdraw.dart';

class Earning extends StatefulWidget {
  String uid;

  Earning(this.uid);

  @override
  _EarningState createState() => _EarningState();
}

class _EarningState extends State<Earning> {



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
        body: SingleChildScrollView(
          child: SafeArea(
            minimum: EdgeInsets.only(top: 20),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            //top header
                            Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      "Earning",
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
                            Container(
                                  //padding: EdgeInsets.symmetric(horizontal: 10),
                                  alignment: Alignment.center,
                                  //profile info
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      //earning box
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.all(20),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex:8,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Earning: This Month",
                                                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700, color: Colors.white),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  //SizedBox(height: 4,),
                                                  SizedBox(
                                                    height: 40,
                                                    width: MediaQuery.of(context).size.width,
                                                    //width: 200,
                                                    child: Divider(
                                                      color: Colors.grey[600],
                                                    ),
                                                  ),
                                                  //earning detail of month
                                                  Container(
                                                    //margin: EdgeInsets.all(15),
                                                    //padding: EdgeInsets.all(5),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            flex:3,
                                                            child: Container(
                                                              //width: 30,
                                                              //height: 30,
                                                              child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text(
                                                                      "Advert Shared",
                                                                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),
                                                                      textAlign: TextAlign.left,
                                                                    ),
                                                                    SizedBox(height: 5,),
                                                                    Text(
                                                                      "Status Seen by",
                                                                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),
                                                                      textAlign: TextAlign.left,
                                                                    ),
                                                                    SizedBox(height: 5,),
                                                                    Text(
                                                                      "Revenue Earned",
                                                                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),
                                                                      textAlign: TextAlign.left,
                                                                    ),
                                                                    SizedBox(height: 5,),
                                                                    Text(
                                                                      "Referrals",
                                                                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),
                                                                      textAlign: TextAlign.left,
                                                                    ),
                                                                    SizedBox(height: 5,),
                                                                  ]
                                                              ),
                                                            )
                                                        ),
                                                        Expanded(
                                                          flex:3,
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Text(
                                                                "9",
                                                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),
                                                                textAlign: TextAlign.center,
                                                              ),
                                                              SizedBox(height: 5,),
                                                              Text(
                                                                "156",
                                                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),
                                                                textAlign: TextAlign.center,
                                                              ),
                                                              SizedBox(height: 5,),
                                                              Text(
                                                                "10.43",
                                                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),
                                                                textAlign: TextAlign.center,
                                                              ),
                                                              SizedBox(height: 5,),
                                                              Text(
                                                                "0",
                                                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),
                                                                textAlign: TextAlign.center,
                                                              ),
                                                              SizedBox(height: 5,),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex:3,
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Text(
                                                                "10.43",
                                                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.white),
                                                                textAlign: TextAlign.center,
                                                              ),
                                                              SizedBox(height: 5,),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    "Earning: All Time",
                                                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700, color: Colors.white),
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
                                                  //earning detail of all time
                                                  Container(
                                                    //margin: EdgeInsets.all(15),
                                                    //padding: EdgeInsets.all(5),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            flex:3,
                                                            child: Container(
                                                              //width: 30,
                                                              //height: 30,
                                                              child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text(
                                                                      "Advert Shared",
                                                                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),
                                                                      textAlign: TextAlign.left,
                                                                    ),
                                                                    SizedBox(height: 5,),
                                                                    Text(
                                                                      "Status Seen by",
                                                                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),
                                                                      textAlign: TextAlign.left,
                                                                    ),
                                                                    SizedBox(height: 5,),
                                                                    Text(
                                                                      "Revenue Earned",
                                                                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),
                                                                      textAlign: TextAlign.left,
                                                                    ),
                                                                    SizedBox(height: 5,),
                                                                    Text(
                                                                      "Referrals",
                                                                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),
                                                                      textAlign: TextAlign.left,
                                                                    ),
                                                                    SizedBox(height: 5,),
                                                                  ]
                                                              ),
                                                            )
                                                        ),
                                                        Expanded(
                                                          flex:3,
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Text(
                                                                "90",
                                                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),
                                                                textAlign: TextAlign.center,
                                                              ),
                                                              SizedBox(height: 5,),
                                                              Text(
                                                                "1050",
                                                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),
                                                                textAlign: TextAlign.center,
                                                              ),
                                                              SizedBox(height: 5,),
                                                              Text(
                                                                "100.43",
                                                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),
                                                                textAlign: TextAlign.center,
                                                              ),
                                                              SizedBox(height: 5,),
                                                              Text(
                                                                "32",
                                                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),
                                                                textAlign: TextAlign.center,
                                                              ),
                                                              SizedBox(height: 5,),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex:3,
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Text(
                                                                "100.43",
                                                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.white),
                                                                textAlign: TextAlign.center,
                                                              ),
                                                              SizedBox(height: 5,),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  //SizedBox(height: 4,),
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
                                      SizedBox(
                                        height: 40,
                                        width: MediaQuery.of(context).size.width,
                                        //width: 200,
                                        child: Divider(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Text(
                                        "Status Pay Amount: 10.21", style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      //button
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 80),
                                        child: Container(
                                          padding: EdgeInsets.only(top: 3, left: 3),
                                          child: MaterialButton(
                                            minWidth: double.infinity,
                                            //height: 50,
                                            onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder:(context)=>WithdrawScreen()));
                                            },
                                            color: Colors.blueAccent,
                                            elevation: 8,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),

                                            ),
                                            child: Text(
                                              "Withdraw", style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      
                                      SizedBox(
                                        height :10 ,
                                      ),
                                    ],
                                  ),
                                )
                            

                          ]
                      )
                  ),
                ],
              ),

            ),
          ),
        )
    );
  }
}

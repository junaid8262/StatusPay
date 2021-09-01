import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:stripe_payment/stripe_payment.dart';

import 'Model/Server.dart';

class VisaScreen extends StatefulWidget {

  @override
  _VisaScreenState createState() => new _VisaScreenState();
}

class _VisaScreenState extends State<VisaScreen> {
  var cardController=TextEditingController();
  var expireController=TextEditingController();
  var cvvController=TextEditingController();
  int month=00;
  int year=00;
  payViaExistingCard(BuildContext context,String amount,String number,int exMonth,int exYear,String cvv) async {
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(
        message: 'Please wait...'
    );
    await dialog.show();

    //var expiryArr = card['expiryDate'].split('/');
    CreditCard stripeCard = CreditCard(
      number: number,
      expMonth: exMonth,
      expYear: exYear,
      cvc: cvv,

    );
    var response = await StripeService.payViaExistingCard(
        amount: amount,
        currency: 'AED',
        card: stripeCard
    );
    await dialog.hide();
    print("respones : ${response.message}");
    if(response.success!){
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Success',
        desc: '${response.message.toString()}',
        btnOkOnPress: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => VisaScreen()));
        },
      )..show();
    }
    else{
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Error',
        desc: '${response.message.toString()}',
        btnOkOnPress: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => VisaScreen()));
        },
      )..show();

    }
  }
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
                                                                    "VISA",
                                                                    style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.white),
                                                                    textAlign: TextAlign.left,
                                                                  ),
                                                                  SizedBox(height: 40,),
                                                                  TextFormField(
                                                                    controller: cardController,
                                                                    validator: (value) {
                                                                      if (value == null || value.isEmpty) {
                                                                        return 'Please enter some text';
                                                                      }
                                                                      return null;
                                                                    },
                                                                    decoration: InputDecoration(
                                                                      contentPadding: EdgeInsets.all(15),
                                                                      focusedBorder: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(7.0),
                                                                        borderSide: BorderSide(
                                                                          color: Colors.transparent,
                                                                        ),
                                                                      ),
                                                                      enabledBorder: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(7.0),
                                                                        borderSide: BorderSide(
                                                                            color: Colors.transparent,
                                                                            width: 0.5
                                                                        ),
                                                                      ),
                                                                      border: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(7.0),
                                                                        borderSide: BorderSide(
                                                                          color: Colors.transparent,
                                                                          width: 0.5,
                                                                        ),
                                                                      ),
                                                                      filled: true,
                                                                      fillColor: Colors.white,
                                                                      hintText: "Card Number",
                                                                      // If  you are using latest version of flutter then lable text and hint text shown like this
                                                                      // if you r using flutter less then 1.20.* then maybe this is not working properly
                                                                      floatingLabelBehavior: FloatingLabelBehavior.always,
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
                                                                                  TextFormField(
                                                                                    controller: expireController,
                                                                                    readOnly: true,
                                                                                    onTap: (){
                                                                                      showMonthPicker(
                                                                                        context: context,
                                                                                        firstDate: DateTime(DateTime.now().year - 1, 5),
                                                                                        lastDate: DateTime(DateTime.now().year + 1, 9),
                                                                                        initialDate: DateTime.now(),
                                                                                      ).then((date) {
                                                                                        if (date != null) {
                                                                                          setState(() {
                                                                                            month=date.month;
                                                                                            year=date.year;
                                                                                            expireController.text="$month/${year.toString()[2]}${year.toString()[3]}";
                                                                                          });
                                                                                        }
                                                                                      });
                                                                                    },
                                                                                    validator: (value) {
                                                                                      if (value == null || value.isEmpty) {
                                                                                        return 'Please enter some text';
                                                                                      }
                                                                                      return null;
                                                                                    },
                                                                                    decoration: InputDecoration(
                                                                                      contentPadding: EdgeInsets.all(15),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderRadius: BorderRadius.circular(7.0),
                                                                                        borderSide: BorderSide(
                                                                                          color: Colors.transparent,
                                                                                        ),
                                                                                      ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderRadius: BorderRadius.circular(7.0),
                                                                                        borderSide: BorderSide(
                                                                                            color: Colors.transparent,
                                                                                            width: 0.5
                                                                                        ),
                                                                                      ),
                                                                                      border: OutlineInputBorder(
                                                                                        borderRadius: BorderRadius.circular(7.0),
                                                                                        borderSide: BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                      ),
                                                                                      filled: true,
                                                                                      fillColor: Colors.white,
                                                                                      hintText: "Expire Date",
                                                                                      // If  you are using latest version of flutter then lable text and hint text shown like this
                                                                                      // if you r using flutter less then 1.20.* then maybe this is not working properly
                                                                                      floatingLabelBehavior: FloatingLabelBehavior.always,
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
                                                                            TextFormField(
                                                                              controller: cvvController,
                                                                              keyboardType: TextInputType.number,
                                                                              validator: (value) {
                                                                                if (value == null || value.isEmpty) {
                                                                                  return 'Please enter some text';
                                                                                }
                                                                                return null;
                                                                              },
                                                                              decoration: InputDecoration(
                                                                                contentPadding: EdgeInsets.all(15),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderRadius: BorderRadius.circular(7.0),
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                  ),
                                                                                ),
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderRadius: BorderRadius.circular(7.0),
                                                                                  borderSide: BorderSide(
                                                                                      color: Colors.transparent,
                                                                                      width: 0.5
                                                                                  ),
                                                                                ),
                                                                                border: OutlineInputBorder(
                                                                                  borderRadius: BorderRadius.circular(7.0),
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 0.5,
                                                                                  ),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: Colors.white,
                                                                                hintText: "Card CVV",
                                                                                // If  you are using latest version of flutter then lable text and hint text shown like this
                                                                                // if you r using flutter less then 1.20.* then maybe this is not working properly
                                                                                floatingLabelBehavior: FloatingLabelBehavior.always,
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
                                                                    onPressed: () {
                                                                      //navigationPage();
                                                                      payViaExistingCard(context, '500', cardController.text.trim(), month, year, cvvController.text);
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
                                        color: Colors.blueAccent,
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
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:status_pay_app/Constants/constants.dart';
import 'package:status_pay_app/login.dart';
import 'package:status_pay_app/navigation/bottom_navigation.dart';

import 'Model/user.dart';

class ProfileSetupScreen extends StatefulWidget {
  String email,password,username;

  ProfileSetupScreen(this.email, this.password, this.username);

  @override
  _ProfileSetupScreenState createState() => new _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController refId = TextEditingController();
  TextEditingController numberW = TextEditingController();

  Future register() async {
    var url = "$baseUrl/adduser.php";
    var response = await http.post(Uri.parse(url), body: {
      "name": "${firstName.text.trim()} ${lastName.text.trim()}",
      "email": widget.email,
      "password":widget.password,
      "username": widget.username,

    });
    //var data = json.decode(response.body);
    print("data $response");
    if (response.body == "Data Submit Successfully") {
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>LoginScreen()));

    }

    else {
      final snackBar = SnackBar(content: Text("Registration Failed"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    return response;

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.maxFinite,
              //color: Colors.white,
            ),
            SafeArea(
              child: ListView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(horizontal: 10),
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    //margin: EdgeInsets.all(15),
                    //padding: EdgeInsets.all(5),
                    child: ListView(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SizedBox(height: 10,),
                              //logo
                              Container(
                                //height: MediaQuery.of(context).size.height,
                                height: 150,
                                width: 150,
                                child: Image.asset('assets/images/icon.png', fit: BoxFit.cover,),
                              ),
                              //title
                              Column(
                                children: <Widget>[
                                Text("Setup Your Profile",
                                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                              //form
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                child: Column(
                                children: <Widget>[

                                  // first name
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "First Name",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color:Colors.black
                                        ),

                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                          controller: firstName,
                                          //obscureText: obscureText,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.symmetric(vertical: 3,
                                                  horizontal: 10),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.black)
                                              )
                                          ),

                                          validator: (value){
                                            if (value!.isEmpty)
                                            {
                                              return"Please Enter";
                                            }
                                          }
                                      ),
                                      SizedBox(height: 10,)
                                    ],
                                  ),

                                  //last name
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Last Name",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color:Colors.black
                                        ),

                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                          controller: lastName,
                                          //obscureText: obscureText,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.symmetric(vertical: 3,
                                                  horizontal: 10),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.black)
                                              )
                                          ),

                                          validator: (value){
                                            if (value!.isEmpty)
                                            {
                                              return"Please Enter";
                                            }
                                          }
                                      ),
                                      SizedBox(height: 10,)
                                    ],
                                  ),

                                  //refiD
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Referrer's ID (If any)",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color:Colors.black
                                        ),

                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                          controller: refId,
                                          //obscureText: obscureText,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.symmetric(vertical: 3,
                                                  horizontal: 10),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.black)
                                              )
                                          ),
                                      ),
                                      SizedBox(height: 10,)
                                    ],
                                  ),

                                  //Whatsapp Number
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "WhatsApp Number",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color:Colors.black
                                        ),

                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                          controller: numberW,
                                          //obscureText: obscureText,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.symmetric(vertical: 3,
                                                  horizontal: 10),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.black)
                                              )
                                          ),

                                          validator: (value){
                                            if (value!.isEmpty)
                                            {
                                              return"Please Enter";
                                            }
                                          }
                                      ),
                                      SizedBox(height: 10,)
                                    ],
                                  ),


                                  /*inputFile(label: "First Name"),
                                  inputFile(label: "Last Name"),
                                  inputFile(label: "Referrer's ID (If any)"),
                                  inputFile(label: "WhatsApp Number"),
                               *//*   inputFile(label: "Gender"),
                                  inputFile(label: "Occupation"),
                                  inputFile(label: "Street"),
                                  inputFile(label: "City"),
                                  inputFile(label: "Province"),*/
                                  SizedBox(
                                  height: 5,
                                  ),
                                  ],
                                ),
                              ),
                              //checkout button
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                child: Container(
                                  padding: EdgeInsets.only(top: 3, left: 3),
                                  child: MaterialButton(
                                    //minWidth: double.infinity,
                                    height: 50,
                                    onPressed: () {
                                      if(_formKey.currentState!.validate())
                                        {
                                          register().then((value) => print(value));
                                        }
                                    },
                                    color: Colors.blueAccent,
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      "Proceed to Checkout", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              SizedBox(height: 50,)

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}


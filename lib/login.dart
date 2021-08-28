import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:status_pay_app/Model/user.dart';
import 'package:status_pay_app/forgot_password.dart';
import 'package:status_pay_app/navigation/bottom_navigation.dart';
import 'package:status_pay_app/shared_Prefrences.dart';
import 'package:status_pay_app/sign_up.dart';
import 'package:http/http.dart' as http;
import 'Constants/constants.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future login() async {
    var url = "$baseUrl/getUserData.php";
    var response = await http.post(Uri.parse(url), body: {
      "username": username.text,
      "password": password.text,
    });
    if (response.statusCode == 200){
      print("res ${response.body}");
      if(response.body == 'failed' || response.body == '[]')
        {
          print("no user found");
        }
      else
        {
          List<User> users=[];
          var obj=response.body;
          SharedPref sp = new SharedPref();
          sp.setLoggedIn(true);
          sp.setUserData(obj);

          Iterable blog = json.decode(obj);
          print("cheching : $obj");
          users=blog.map((blog) => new User.fromJson(blog)).toList();
          //User user=User.fromJson();
          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>BottomBar(users[0],users[0].id, true)));
        }

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
      /*appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),


        ),
      ),*/
      body: Form(
        key: _formKey,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: 10,),
                  Container(
                    //height: MediaQuery.of(context).size.height,
                    height: 150,
                    width: 150,
                    //color: Colors.green,
                    child: Image.asset('assets/images/icon.png', fit: BoxFit.cover,),
                  ),
                  Column(
                    children: <Widget>[
                      Text("Sign In",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        inputFile(label: "UserName",controller: username),
                        inputFile(label: "Password",controller: password, obscureText: true),
                        SizedBox(
                          height: 5,
                        ),

                       //forgot password
                       /* TextButton(
                          onPressed: () {
                            //action
                            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>ForgotPasswordScreen()));
                          },
                          child: Text(
                            'Lost Your Password?', //title
                            textAlign: TextAlign.right, //alignment
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),*/
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      child: MaterialButton(
                        //minWidth: double.infinity,
                        height: 50,
                        onPressed: () {
                          if (_formKey.currentState!.validate())
                            {
                              login();
                            }

                        },
                        color: Colors.blueAccent,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),

                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account?", style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          //action
                          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>SignUpScreen()));
                        },
                        child: Text(" Sign Up", style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          ),
                        )
                      ),
                    ],
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

}


// we will be creating a widget for text field
Widget inputFile({label, controller,obscureText = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
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
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 5,
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
              return "Please Enter";
            }
        },
      ),
      SizedBox(height: 10,)
    ],
  );
}
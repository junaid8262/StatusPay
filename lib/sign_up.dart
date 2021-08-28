import 'package:flutter/material.dart';
import 'package:status_pay_app/login.dart';
import 'package:status_pay_app/profile_setup.dart';

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => new _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordC = TextEditingController();


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
                      Text("Sign Up",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[

                        // Email
                        Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Email",
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
                          controller: email,
                          obscureText: false,
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


                          validator:(value){
                            if(value!.isEmpty)
                            {
                              return 'Please a Enter';
                            }
                            if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                              return 'Please a valid Email';
                            }
                            return null;
                          },

                        ),
                        SizedBox(height: 10,)
                      ],
                    ),

                        // username
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Username",
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
                              controller: username,
                              obscureText: false,
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


                              validator:(value){
                                if(value!.isEmpty)
                                {
                                  return 'Please  Enter';
                                }

                                return null;
                              },


                            ),
                            SizedBox(height: 10,)
                          ],
                        ),

                        // password
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Password",
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
                              controller: password,
                              obscureText: true,
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


                              validator:(value){
                                if(value!.isEmpty)
                                {
                                  return 'Please Enter';
                                }

                                return null;
                              },


                            ),
                            SizedBox(height: 10,)
                          ],
                        ),

                        //confirm password
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Confirm Password",
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
                              controller: passwordC,
                              obscureText: true,
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


                              validator:(value){
                                if(value!.isEmpty)
                                {
                                  return 'Please re-enter password';
                                }
                                print(password.text);
                                print(passwordC.text);
                                if(password.text!=passwordC.text){
                                  return "Password does not match";
                                }
                                return null;
                              },



                            ),
                            SizedBox(height: 10,)
                          ],
                        ),


                        SizedBox(
                          height: 5,
                        ),
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
                          //action
                          if (_formKey.currentState!.validate())
                            {
                              Navigator.push(context, MaterialPageRoute(builder:(context)=>ProfileSetupScreen(email.text.trim() , password.text.trim(),username.text.trim())));
                            }

                        },
                        color: Colors.blueAccent,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),

                        ),
                        child: Text(
                          "Sign Up", style: TextStyle(
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
                      Text("Already have an account?", style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      ),
                      TextButton(
                          onPressed: () {
                            //action
                            Navigator.push(context, MaterialPageRoute(builder:(context)=>LoginScreen()));
                          },
                          child: Text(" Sign In",
                            style: TextStyle(
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


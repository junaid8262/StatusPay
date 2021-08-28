import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:status_pay_app/login.dart';
import 'package:status_pay_app/sign_up.dart';

class NewPasswordScreen extends StatefulWidget {
  @override
  _NewPasswordScreenState createState() => new _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {

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
      body: Container(
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
                    Text("New Password",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),),
                    SizedBox(height: 10,),
                    Text("Please Enter a new password",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      inputFile(label:"",obscureText: true),
                      inputFile(label:"",obscureText: true),
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
                      onPressed: () {},
                      color: Colors.blueAccent,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),

                      ),
                      child: Text(
                        "Confirm", style: TextStyle(
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
                    Text("Back to", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        //action
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>LoginScreen()));
                      },
                      child: Text(" Sign In", style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
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
    );
  }

}


// we will be creating a widget for text field
Widget inputFile({label, obscureText = false})
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
      TextField(
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
            ),
            hintText: 'New Password'
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}
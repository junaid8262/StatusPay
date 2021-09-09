import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:status_pay_app/login.dart';
import 'package:toast/toast.dart';

class ProfileSetupScreen extends StatefulWidget {
  String email, password, username;

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
  TextEditingController gender = TextEditingController();
  TextEditingController occupation = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController province = TextEditingController();

  // My sql
  /*
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

  }*/

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
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                //logo
                                Container(
                                  //height: MediaQuery.of(context).size.height,
                                  height: 150,
                                  width: 150,
                                  child: Image.asset(
                                    'assets/images/icon.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                //title
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "Setup Your Profile",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                ),
                                //form
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          _showPicker(context);
                                        },
                                        child: photoUrl == ""
                                            ? Center(
                                                child: Container(
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.grey,
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/images/profile.jpg'),
                                                        fit: BoxFit.contain,
                                                      )),
                                                ),
                                              )
                                            : Center(
                                                child: Container(
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.grey,
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            photoUrl),
                                                        fit: BoxFit.contain,
                                                      )),
                                                ),
                                              ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),

                                      // first name
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "First Name",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                              controller: firstName,
                                              //obscureText: obscureText,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 3,
                                                          horizontal: 10),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.black))),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please Enter";
                                                }
                                              }),
                                          SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),

                                      //last name
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Last Name",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                              controller: lastName,
                                              //obscureText: obscureText,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 3,
                                                          horizontal: 10),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.black))),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please Enter";
                                                }
                                              }),
                                          SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),

                                      //refiD
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Referrer's ID (If any)",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller: refId,
                                            //obscureText: obscureText,
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 3,
                                                        horizontal: 10),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black))),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),

                                      //Whatsapp Number
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "WhatsApp Number",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                              controller: numberW,
                                              //obscureText: obscureText,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 3,
                                                          horizontal: 10),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.black))),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please Enter";
                                                }
                                              }),
                                          SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),

                                      //gender
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Gender",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                              controller: gender,
                                              //obscureText: obscureText,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 3,
                                                          horizontal: 10),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.black))),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please Enter";
                                                }
                                              }),
                                          SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),

                                      //occupation
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Occupation",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                              controller: occupation,
                                              //obscureText: obscureText,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 3,
                                                          horizontal: 10),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.black))),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please Enter";
                                                }
                                              }),
                                          SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),

                                      //street
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Street",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                              controller: street,
                                              //obscureText: obscureText,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 3,
                                                          horizontal: 10),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.black))),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please Enter";
                                                }
                                              }),
                                          SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),

                                      //city
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "city",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                              controller: city,
                                              //obscureText: obscureText,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 3,
                                                          horizontal: 10),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.black))),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please Enter";
                                                }
                                              }),
                                          SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),

                                      //province
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Province",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                              controller: province,
                                              //obscureText: obscureText,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 3,
                                                          horizontal: 10),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.black))),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please Enter";
                                                }
                                              }),
                                          SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),

                                      /*inputFile(label: "First Name"),
                                  inputFile(label: "Last Name"),
                                  inputFile(label: "Referrer's ID (If any)"),
                                  inputFile(label: "WhatsApp Number"),
                               */ /*   inputFile(label: "Gender"),
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
                                        if (_formKey.currentState!.validate()) {
                                          _register();
                                        }
                                      },
                                      color: Colors.blueAccent,
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        "Proceed to Checkout",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  // registering email and password
  Future _register() async {
    print("email :  ${widget.email}");
    print("email :  ${widget.password}");
    try {
      final ProgressDialog pr = ProgressDialog(context);
      pr.style(
        message: 'Please Wait...',
        progressWidget: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.blueAccent),
        ),
      );
      pr.show();
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: widget.email.trim(),
        password: widget.password.trim(),
      )
          .whenComplete(() {
        pr.hide();
        final FirebaseAuth auth = FirebaseAuth.instance;
        final User? user = auth.currentUser;
        var uid = user!.uid;
        print("user id : $uid");
        updateUserData(uid).whenComplete(() =>  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>LoginScreen())),
        );
      });
    } on FirebaseAuthException catch (e) {
      print("error code : ${e.code}");
      if (e.code == "weak-password") {
        Scaffold.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 2),
          backgroundColor: Colors.blueAccent,
          content: Text(
            "Weak Password",
          ),
        ));
      }

      if (e.code == 'email-already-in-use') {
        Scaffold.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 2),
          backgroundColor: Colors.blueAccent,
          content: Text(
            "Already Registered",
          ),
        ));
      }

      if (e.code == 'network-request-failed') {
        Scaffold.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 2),
          backgroundColor: Colors.blueAccent,
          content: Text(
            "No Network",
          ),
        ));
      }
    }
  }

  final CollectionReference userDetails =
      FirebaseFirestore.instance.collection('userDetail');

  Future updateUserData(String uid) async {
    return await userDetails.doc(uid).set({
      "email": widget.email,
      "username": widget.username,
      'profile': photoUrl,
      "fullName": "${firstName.text.trim()} ${lastName.text.trim()}",
      "whatsapp": numberW.text.trim(),
      "gender": gender.text.trim(),
      "occupation": occupation.text.trim(),
      "street": street.text.trim(),
      "city": city.text.trim(),
      "province": province.text.trim(),
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _chooseGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _choosecamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  late File imageFiles;
  late File imagefile;
  String photoUrl = "";

  Future uploadImageToFirebase(BuildContext context) async {
    final ProgressDialog pr = ProgressDialog(context);
    await pr.show();
    firebase_storage.Reference firebaseStorageRef = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('uploads/${DateTime.now().millisecondsSinceEpoch}');
    firebase_storage.UploadTask uploadTask =
        firebaseStorageRef.putFile(imagefile);
    firebase_storage.TaskSnapshot taskSnapshot = await uploadTask;
    taskSnapshot.ref.getDownloadURL().then(
      (value) {

        photoUrl = value;
        print("value $value");
        pr.hide();

      },
    ).onError((error, stackTrace) {
      Toast.show(error.toString(), context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    });
  }

  void fileSet(File file) {
    setState(() {
      if (file != null) {
        imagefile = file;
      }
    });
    uploadImageToFirebase(context);
  }

  Future<void> _chooseGallery() async => await ImagePicker()
      .getImage(source: ImageSource.gallery)
      .then((value) => fileSet(File(value!.path)));

  Future<void> _choosecamera() async => await ImagePicker()
      .getImage(source: ImageSource.camera)
      .then((value) => fileSet(File(value!.path)));
}

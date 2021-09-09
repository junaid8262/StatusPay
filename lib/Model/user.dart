/*
class User{
  String id, loginName , userName , email , password ;


  User(this.id,this.loginName, this.userName, this.email,  this.password);

  User.fromJson(Map<String, dynamic> jsonData):
        id= jsonData['ID'],
  loginName= jsonData['user_login'],
  userName= jsonData['display_name'],
  email= jsonData['user_email'],
  password= jsonData['user_pass'];
}*/
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String email,fullName,username,whatsapp,profile,occupation,gender,street,city,province;


  UserModel(
      this.email,
      this.fullName,
      this.username,
      this.whatsapp,
      this.profile,
      this.occupation,
      this.gender,
      this.street,
      this.city,
      this.province);

  UserModel.fromMap(Map<String,dynamic> map,String key)
      :email = map['email'],
        fullName = map['fullName'],
        username = map['username'],
        whatsapp = map['whatsapp'],
        profile = map['profile'],
        occupation = map['occupation'],
        gender = map['gender'],
        street = map['street'],
        city = map['city'],
        province = map['province'];




      UserModel.fromSnapshot(DocumentSnapshot snapshot )
      : this.fromMap(snapshot.data() as Map<String, dynamic>,snapshot.reference.id);
}
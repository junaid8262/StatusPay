class User{
  String id, loginName , userName , email , password ;


  User(this.id,this.loginName, this.userName, this.email,  this.password);

  User.fromJson(Map<String, dynamic> jsonData):
        id= jsonData['ID'],
  loginName= jsonData['user_login'],
  userName= jsonData['display_name'],
  email= jsonData['user_email'],
  password= jsonData['user_pass'];
}
class Auth{
  final String? name,username,adress,school,age,cpa,gender,uid,asset;
  Auth({this.adress, this.school, this.age, this.cpa, this.gender,this.name,this.username,this.uid,this.asset});
}// models for profile
//uid to access authList

class MyUser{
  String? uid;
  MyUser({this.uid});
}//unique uid when user sign up
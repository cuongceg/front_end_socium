import 'dart:io';
class User{
  final String? email,adress,school,age,cpa,gender;
  User(this.email, this.adress, this.school, this.age, this.cpa, this.gender);
}
class Auth{
  final String name,username,image;
  bool isFollowedByMe;
  Auth(this.name, this.username, this.image, this.isFollowedByMe);
}
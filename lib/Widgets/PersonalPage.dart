import 'package:app/Login/SignIn.dart';
import 'package:app/Widgets/Proflie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/models/user.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
class ProfileScreen extends StatelessWidget {
  final User? user;
  const ProfileScreen({this.user,super.key});
  @override
  Widget build(BuildContext context) {
    double heightR=MediaQuery.of(context).size.height;
    double widthR=MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Colors.white
        )
    );
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child:imageProfile(),
              ),
              SizedBox(
                width: widthR,
                height: heightR/13,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('4,5/5      ',style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold)),
                    Text('609 Likes      ',style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold)),
                    Text('3 Friends',style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              const Divider(
                height: 10,
                thickness: 2,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Account Settings',style: GoogleFonts.roboto(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
                    TextButton(
                        onPressed:(){
                          Get.to(()=>const MyProfileWidget());
                        },
                        child: Text('Edit',style: GoogleFonts.roboto(fontSize: 16,color: Colors.blue)))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: widthR/2,
                  height: heightR/15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black
                      )
                  ),
                  child: Center(
                      child:ListTile(
                          leading:const Icon(Icons.home),
                          title: Text('609 Trương Định,Thịnh Liệt,Hoàng Mai,Hà Nội',style: GoogleFonts.roboto(fontSize: 16,color: Colors.black)),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: widthR/2,
                  height: heightR/15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.black
                      )
                  ),
                  child: Center(
                      child:ListTile(
                        leading:const Icon(Icons.people),
                        title: Text('Male,19 years old',style: GoogleFonts.roboto(fontSize: 16))
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: widthR/2,
                  height: heightR/15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.black
                      )
                  ),
                  child: Center(
                      child:ListTile(
                          leading:const Icon(Icons.school),
                          title: Text('Hanoi University of Science and Technology',style: GoogleFonts.roboto(fontSize: 16))
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: widthR/2,
                  height: heightR/16,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.black
                      )
                  ),
                  child: Center(
                      child:ListTile(
                          leading:const Icon(Icons.grade),
                          title: Text('CPA:4.0',style: GoogleFonts.roboto(fontSize: 18))
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: widthR/2,
                  height: heightR/16,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.black
                      )
                  ),
                  child: Center(
                      child:ListTile(
                          leading:const Icon(Icons.phone),
                          title: Text('0985976571',style: GoogleFonts.roboto(fontSize: 18))
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: widthR/2,
                  height: heightR/16,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.black
                      )
                  ),
                  child: Center(
                      child:ListTile(
                          leading:const Icon(Icons.email),
                          title: Text('Cuong.dm225172@sis.hust.edu.vn',style: GoogleFonts.roboto(fontSize: 18))
                      )),
                ),
              ),
              const Divider(
                height: 10,
                thickness: 0.5,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Description',style: GoogleFonts.roboto(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
                    TextButton(
                        onPressed:(){
                          Get.to(()=>const MyProfileWidget());
                        },
                        child: Text('Edit',style: GoogleFonts.roboto(fontSize: 16,color: Colors.blue)))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: widthR/2,
                  height: heightR/16,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.black
                      )
                  ),
                  child: Center(
                      child:ListTile(
                          leading:const Icon(Icons.library_books_outlined),
                          title: Text('Write our Biography and Hobby',style: GoogleFonts.roboto(fontSize: 18))
                      )),
                ),
              ),
              const Divider(
                height: 10,
                thickness: 0.5,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Change Password',style: GoogleFonts.roboto(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
                    IconButton(
                      onPressed:(){},
                      icon: Icon(Icons.settings),
                      iconSize: 25,
                    )
                  ],
                ),
              ),
              const Divider(
                height: 10,
                thickness: 0.5,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Log Out',style: GoogleFonts.roboto(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
                    IconButton(
                      onPressed:(){
                          Get.to(()=>const Login());
                        },
                      icon: Icon(Icons.logout,color: Colors.black,),
                      iconSize: 25,
                    )
                  ],
                ),
              ),
            ],
          ),
      );
  }
  Widget imageProfile(){
    return const Center(
      child: CircleAvatar(
        radius:80.0,
        backgroundImage:AssetImage('assets/images/avatarimage.png'),
      ),
    );
  }
}


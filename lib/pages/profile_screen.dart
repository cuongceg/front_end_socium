import 'package:app/Login/sign_in.dart';
import 'package:app/Widgets/edit_profile.dart';
import 'package:app/models/user.dart';
import 'package:app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double heightR=MediaQuery.of(context).size.height;
    double widthR=MediaQuery.of(context).size.width;
    final authList=Provider.of<List<Auth>?>(context);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
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
                child:Padding(
                  padding: EdgeInsets.symmetric(horizontal:widthR/5),
                )
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
                  child: Center(child:ListTile(
                    leading:Image.asset('assets/images/id-card.png',width: widthR/15,height: heightR/15),
                    title: Text(authList== null?'Your Name':authList[0].name!,style: GoogleFonts.roboto(fontSize: 16,color: Colors.black)),
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
                          leading:Image.asset('assets/images/age.png',width: widthR/15,height: heightR/15,),
                          title: Text(authList== null?'Your age':authList[0].age!,style: GoogleFonts.roboto(fontSize: 16))
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
                          leading:Image.asset('assets/images/gender-neutral.png',width: widthR/15,height: heightR/15),
                          title: Text(authList== null?'Your gender':authList[0].gender!,style: GoogleFonts.roboto(fontSize: 16))
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
                  child: Center(child:ListTile(
                          leading:Image.asset('assets/images/house.png',width: widthR/15,height: heightR/15,),
                          title: Text(authList== null?'Ha Noi':authList[0].adress!,style: GoogleFonts.roboto(fontSize: 16,color: Colors.black)),
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
                          leading:Image.asset('assets/images/school.png',width: widthR/15,height: heightR/15,),
                          title: Text(authList== null?'Your school':authList[0].school!,style: GoogleFonts.roboto(fontSize: 16))
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
                          leading:Image.asset('assets/images/gpa.png',width: widthR/15,height: heightR/15,),
                          title: Text(authList== null?'Your CPA':authList[0].cpa!,style: GoogleFonts.roboto(fontSize: 18))
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
                      icon: const Icon(Icons.settings),
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
                        AuthService().signOut();
                        Get.to(()=>const Login());
                        },
                      icon: const Icon(Icons.logout,color: Colors.black,),
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


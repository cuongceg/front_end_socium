import 'package:app/Login/sign_in.dart';
import 'package:app/Widgets/edit_profile.dart';
import 'package:app/const_value.dart';
import 'package:app/models/user.dart';
import 'package:app/services/auth.dart';
import 'package:app/widgets/location_on.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:app/widgets/update_password.dart';
import 'dart:io';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  String name='',age='',adress='',gender='',cpa='',school='',imagePath='';
  int index=0;

  @override
  Widget build(BuildContext context) {
    double heightR=MediaQuery.of(context).size.height;
    double widthR=MediaQuery.of(context).size.width;
    final user=Provider.of<MyUser?>(context);
    final authList=Provider.of<List<Auth>?>(context);
    if(authList!=null){
      for(int i=0;i<authList.length;i++){
        if(authList[i].uid==user!.uid){
          index=i;
        }
      }
      name=authList[index].name??'Your name';
      age=authList[index].age??'Your age';
      adress=authList[index].age??'Your adress';
      gender=authList[index].gender??'Your gender';
      school=authList[index].school??'Your school';
      cpa=authList[index].cpa??'Your cpa';
      imagePath=authList[index].asset??'';
    }
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
                child:Center(
                  child: CircleAvatar(
                    radius:80.0,
                    backgroundImage:authList?[index].asset==null?const AssetImage('assets/images/default_avatar1.png'):FileImage(File(imagePath))as ImageProvider,
                  ),
                ),
              ),
              SizedBox(
                width: widthR/0.8,
                height: heightR/13,
                child:Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('10 friends',style:Font().headingBlack,),
                      Text('10 posts',style:Font().headingBlack,)
                    ],
                  ),
                )
              ),
              ConstWigdet().thickDivider(),
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
              textProfile('assets/images/id-card.png',name, widthR, heightR),
              textProfile('assets/images/age.png',age, widthR, heightR),
              textProfile('assets/images/gender-neutral.png',gender, widthR, heightR),
              textProfile('assets/images/house.png',adress, widthR, heightR),
              textProfile('assets/images/school.png',school, widthR, heightR),
              textProfile('assets/images/gpa.png',cpa, widthR, heightR),
              ConstWigdet().thinDivider(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Description',style: GoogleFonts.roboto(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
                    TextButton(
                        onPressed:(){
                        },
                        child: Text('Edit',style: GoogleFonts.roboto(fontSize: 16,color: Colors.blue)))
                  ],
                ),
              ),
              textProfile('assets/images/description.png','Write our Biography and Hobby', widthR, heightR),
              ConstWigdet().thinDivider(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Change Password',style:Font().bodyProfile),
                    IconButton(
                      onPressed:(){
                        Get.to(()=>const UpdatePassword());
                      },
                      icon: const Icon(Icons.settings),
                      iconSize: 25,
                    )
                  ],
                ),
              ),
              ConstWigdet().thinDivider(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Location',style:Font().bodyProfile),
                    IconButton(
                      onPressed:(){
                        Get.to(()=>GeolocatorWidget());
                      },
                      icon: const Icon(Icons.location_on,color: Colors.black,),
                      iconSize: 25,
                    )
                  ],
                ),
              ),
              ConstWigdet().thinDivider(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Log Out',style:Font().bodyProfile),
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
  Widget textProfile(String asset,String text,double widthR,double heightR){
    return Padding(
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
                leading:Image.asset(asset,width: widthR/15,height: heightR/15,),
                title: Text(text,style:Font().bodyBlack)
            )),
      ),
    );
  }
}


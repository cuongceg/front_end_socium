import 'package:app/Login/sign_in.dart';
import 'package:app/Widgets/edit_profile.dart';
import 'package:app/const_value.dart';
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
    int index=0;
    double heightR=MediaQuery.of(context).size.height;
    double widthR=MediaQuery.of(context).size.width;
    final user=Provider.of<MyUser?>(context);
    final authList=Provider.of<List<Auth>?>(context);
    for(int i=0;i<authList!.length;i++){
      if(authList[i].uid==user!.uid){
        index=i;
      }
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
                child:imageProfile(),
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
              textProfile('assets/images/id-card.png',authList[index].name??'Your Name', widthR, heightR),
              textProfile('assets/images/age.png',(authList[index].age==null)?'Your age':authList[index].age!, widthR, heightR),
              textProfile('assets/images/gender-neutral.png',(authList[index].gender==null)?'Your gender':authList[index].gender!, widthR, heightR),
              textProfile('assets/images/house.png',(authList[index].adress==null)?'Ha Noi':authList[index].adress!, widthR, heightR),
              textProfile('assets/images/school.png',(authList[index].school==null)?'Your school':authList[index].school!, widthR, heightR),
              textProfile('assets/images/gpa.png',(authList[index].cpa==null)?'Your CPA':authList[index].cpa!, widthR, heightR),
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
                    Text('Change Password',style: GoogleFonts.roboto(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
                    IconButton(
                      onPressed:(){
                        print(authList[2].uid);
                        print(user!.uid);
                        print(index);
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
  Widget imageProfile(){
    return const Center(
      child: CircleAvatar(
        radius:80.0,
        backgroundImage:AssetImage('assets/images/avatarimage.png'),
      ),
    );
  }
}


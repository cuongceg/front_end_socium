import 'package:app/Login/SignIn.dart';
import 'package:app/Widgets/Proflie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart'as badges;
import 'package:get/get.dart';
class SlideBar extends StatefulWidget {
  const SlideBar({super.key});
  @override
  State<SlideBar> createState() => _SlideBarState();
}

class _SlideBarState extends State<SlideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
               UserAccountsDrawerHeader(
                accountName: Text('cuongceg',style:GoogleFonts.roboto(fontSize:14,fontWeight:FontWeight.bold)),
                accountEmail: Text('Cuong.DM225172@sis.hust.edu.vn',style:GoogleFonts.roboto(fontSize: 15)),
                currentAccountPicture:const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatarimage.png'),
                ),
                decoration:const BoxDecoration(
                  image: DecorationImage(
                    image:AssetImage('assets/images/coverimage.png'),
                    fit: BoxFit.cover
                  )
                ),
              ),
              ListTile(
                leading: const badges.Badge(
                  badgeAnimation: badges.BadgeAnimation.slide(
                    animationDuration: Duration(seconds: 1),
                    colorChangeAnimationDuration: Duration(seconds: 1),
                    loopAnimation: false,
                    curve: Curves.fastOutSlowIn,
                    colorChangeAnimationCurve: Curves.easeInCubic,
                  ),
                  badgeContent: Text('2'),
                  badgeStyle: badges.BadgeStyle(
                      badgeColor:Colors.blue,
                      shape: badges.BadgeShape.circle
                  ),
                  child: Icon(Icons.people_alt),
                ),
                title: const Text('Friends'),
                onTap: (){},
              ),
              ListTile(
                leading:const badges.Badge(
                  badgeAnimation: badges.BadgeAnimation.slide(
                  animationDuration: Duration(seconds: 1),
                  colorChangeAnimationDuration: Duration(seconds: 1),
                  loopAnimation: false,
                  curve: Curves.fastOutSlowIn,
                  colorChangeAnimationCurve: Curves.easeInCubic,
                 ),
                badgeContent: Text('2'),
                badgeStyle: badges.BadgeStyle(
                badgeColor:Colors.blue,
                shape: badges.BadgeShape.circle
                ),
                  child: Icon(Icons.notifications),
                ),
                title: const Text('Notifications'),
                onTap: (){
                  showBottomSheet<void>
                    (context: context,
                      builder:(BuildContext context){
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.deepPurple,width: 2),
                        ),
                        child: ListView(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('You have a new request from Tran Bao Ngoc',),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('You have a new request from Huy Nam'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('You have a new request from Mai Yen Nhi'),
                            ),
                          ],
                        ),
                      );
                      }
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.update),
                title: const Text('Update Profile'),
                onTap: (){
                  Get.to(()=>MyProfileWidget());
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Change password'),
                onTap: (){},
              ),
              ListTile(
                leading:const Icon(Icons.logout),
                title: const Text('Log out'),
                onTap: (){
                  Get.to(()=>Login());
                },
              )
            ],
          ),
        );
  }
}


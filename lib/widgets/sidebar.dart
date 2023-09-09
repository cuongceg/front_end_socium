import 'package:app/Login/SignIn.dart';
import 'package:app/Widgets/PersonalPage.dart';
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
                leading: const Icon(Icons.alarm),
                title: const Text('Group A will start in 7:00h'),
                onTap: (){},
              ),
              const Divider(
                indent: 1,
                endIndent: 0.5,
                height: 10,
                thickness: 0.5,
                color: Colors.black,
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Change password successfully'),
                onTap: (){},
              ),
              const Divider(
                indent: 1,
                endIndent: 0.5,
                height: 10,
                thickness: 0.5,
                color: Colors.black,
              ),
              ListTile(
                leading:const Icon(Icons.people),
                title: const Text('Admin add you to group'),
                onTap: (){},
              ),
              const Divider(
                indent: 1,
                endIndent: 0.5,
                height: 10,
                thickness: 0.5,
                color: Colors.black,
              ),
            ],
          ),
        );
  }
}


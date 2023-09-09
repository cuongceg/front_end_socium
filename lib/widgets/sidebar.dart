import 'package:app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
class SlideBar extends StatefulWidget {
  const SlideBar({super.key});
  @override
  State<SlideBar> createState() => _SlideBarState();
}

class _SlideBarState extends State<SlideBar> {
  @override
  Widget build(BuildContext context) {
    final authList=Provider.of<List<Auth>?>(context);
    return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
               UserAccountsDrawerHeader(
                accountName: Text('Hello,',style:GoogleFonts.playfairDisplay(fontSize:20,fontWeight:FontWeight.bold,fontStyle: FontStyle.italic)),
                accountEmail: Text(authList==null?'':authList[0].username!,style:GoogleFonts.roboto(fontSize: 17)),
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


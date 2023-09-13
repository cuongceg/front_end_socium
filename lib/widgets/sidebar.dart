import 'package:app/models/time_study.dart';
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
    final studyList=Provider.of<List<TimeStudy>?>(context);
    double widthR=MediaQuery.of(context).size.width;
    double heightR=MediaQuery.of(context).size.height;
    final heading=GoogleFonts.roboto(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold);
    final body=GoogleFonts.roboto(color:Colors.black,fontSize:20);
    final smallBody=GoogleFonts.roboto(color: Colors.black,fontSize:15);
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.only(top:30),
        children: [
          ListTile(
            leading: const Icon(Icons.menu),
            title: Text("Notifications",style: heading,),
          ),
          const Divider(
            thickness: 2,
            indent: 1,
            endIndent: 0.5,
            height: 10,
            color: Colors.black,
          ),
          for(var study in studyList!)...[
            ListTile(
              leading: Image.asset('assets/images/clock.png',width: widthR/13,height: heightR/13,),
              title: Text('Group ${study.name!}',style: body,),
              subtitle: Text('begin at ${study.hour!}:${study.minutes!}',style: smallBody,),
            ),
            const Divider(
              indent: 1,
              endIndent: 0.5,
              height: 10,
              thickness: 0.5,
              color: Colors.black,
            ),
          ]
        ],
      ),
    );
  }
}
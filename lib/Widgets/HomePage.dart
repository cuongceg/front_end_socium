import 'package:app/Widgets/SearchPage.dart';
import 'package:app/Widgets/SideBar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SlideBar(),
      appBar: AppBar(
        backgroundColor: Colors.purple[50],
        title:Text('Hello cuongceg',style: GoogleFonts.roboto(fontSize: 20,color: Colors.black54)),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu_open,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(
              onPressed:(){
              },
              icon: const Icon(Icons.message_outlined,color: Colors.black,))
        ],
      ),
      backgroundColor: Colors.white,
      body: SearchPage()
    );
  }
}
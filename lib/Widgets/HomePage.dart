import 'package:app/Widgets/PersonalPage.dart';
import 'package:app/Widgets/SearchPage.dart';
import 'package:app/Widgets/SideBar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    const Text("trang 1"),
    const Text('trang 2'),
    const Text('trang 3'),
    const ProfileScreen()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Colors.white
        )
    );
    return Scaffold(
        drawer: const SlideBar(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:Text('Socium',style: GoogleFonts.roboto(color: Colors.black,fontSize:22),),
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu_book,
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
                onPressed:()=>Get.to(()=>SearchPage()),
                icon:Image.asset('assets/images/filter1.png'))
          ],
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home,color:Colors.purple[100],),
                label: 'Home',
                tooltip:'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month,color:Colors.purple[100],),
              label: 'Calendar',
              tooltip:'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined,color:Colors.purple[100],),
              label: 'Chat',
              tooltip:'Chat',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person,color:Colors.purple[100],),
                tooltip: 'Profile',
                label: 'Profile'
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.purple[100],
          onTap: _onItemTapped,
        ),
      );
  }
  @pragma('vm:entry-point')
  static Route<Object?> showAlert(BuildContext context, Object? arguments) {
    return DialogRoute<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notifications'),
          actions: <Widget>[
            TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                onPressed:(){
                  Navigator.pop(context);
                } ,
                child: const Text(
                  'Back',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                )
            )
          ],
        );
      },
    );
  }
}
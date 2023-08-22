import 'package:get/get.dart';
import 'package:app/Login/SignIn.dart';
import 'package:flutter/material.dart';
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
    const Text('trang 3')
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[200],
          leading: Builder(
              builder: (BuildContext context){
                return IconButton(
                    icon:const Icon(Icons.notifications_active),
                    onPressed: (){
                      Navigator.of(context).restorablePush(showAlert);
                    }
                );
              }
          ),
          title: const Text('Hello'),
          actions: [
            IconButton(
              icon:const Icon(Icons.logout),
              onPressed: () async{
                Get.to(Login());
              },
              tooltip: 'log out',
            )
          ],
        ),
        backgroundColor: Colors.purple[50],
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.search_sharp,color:Colors.purple[100],),
                label: 'Search',
                tooltip:'Search people.'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.messenger,color:Colors.purple[100],),
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
          selectedItemColor: Colors.blueAccent,
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
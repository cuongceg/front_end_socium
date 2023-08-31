import 'package:app/Widgets/PersonalPage.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';
import 'package:app/Widgets/SideBar.dart';
import 'package:app/Widgets/calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:badges/badges.dart'as badges;
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String? _topModelData;
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    const Text("trang 1"),
    TableEventsExample(),
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
        const SystemUiOverlayStyle(
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
                icon:const badges.Badge(
                  badgeAnimation:badges.BadgeAnimation.slide(
                    animationDuration: Duration(seconds: 1),
                    colorChangeAnimationDuration: Duration(seconds: 1),
                    loopAnimation: false,
                    curve: Curves.fastOutSlowIn,
                    colorChangeAnimationCurve: Curves.easeInCubic,
                  ),
                  badgeContent:Text('3'),
                  badgeStyle:badges.BadgeStyle(
                      badgeColor:Colors.blueAccent,
                      shape: badges.BadgeShape.circle
                  ),
                  child: Icon(Icons.notifications_active_outlined,color:Colors.black,),
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
                onPressed:()async{
                  var value=await showTopModalSheet<String?>(context,const topModel());
                  setState(() {
                    _topModelData=value;
                  });
                },
                icon:Image.asset('assets/images/filter1.png',width:30,height:25,),)
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
              icon: badges.Badge(
                badgeAnimation: const badges.BadgeAnimation.slide(
                  animationDuration: Duration(seconds: 1),
                  colorChangeAnimationDuration: Duration(seconds: 1),
                  loopAnimation: false,
                  curve: Curves.fastOutSlowIn,
                  colorChangeAnimationCurve: Curves.easeInCubic,
                ),
                badgeContent: const Text('2'),
                badgeStyle: const badges.BadgeStyle(
                    badgeColor:Colors.blueAccent,
                    shape: badges.BadgeShape.circle
                ),
                child: Icon(Icons.message_outlined,color:Colors.purple[100],),
              ),
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
}
class topModel extends StatefulWidget {
  const topModel({super.key});
  @override
  State<topModel> createState() => _topModelState();
}

class _topModelState extends State<topModel> {
  List<String>Study=['Online','Offline','Both of them'];
  List<String>Options=['Morning','Afternoon','Evening'];
  List<String> tags = ['Education'];
  String? Study_choose;
  SfRangeValues _values = SfRangeValues(DateTime(18, 01,18), DateTime(20, 01,20));
  @override
  Widget build(BuildContext context) {
    double heightR=MediaQuery.of(context).size.height;
    double widthR=MediaQuery.of(context).size.width;
    return Container(
      width:widthR,
      height: heightR/2,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius:BorderRadius.only(
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(100),
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed:(){Navigator.pop(context);},
                    icon:const Icon(Icons.arrow_back,color: Colors.black45,size: 30,)
                ),
                Text('Filter',style: GoogleFonts.roboto(color: Colors.black,fontSize:22)),
                IconButton(
                    onPressed:(){Navigator.pop(context);},
                    icon:Icon(Icons.done,size: 30,color: Colors.purple[100],)
                )
              ],
            ),
          ),
          Padding(
              padding:const EdgeInsets.only(left:30,top:10,bottom:0),
              child: SizedBox(
                  height: heightR/20,
                  width: widthR,
                  child: Text('Time',style: GoogleFonts.roboto(fontSize:22,color: Colors.black,fontWeight: FontWeight.bold),
                  )
              )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:35),
            child: SizedBox(
              width: widthR,
              height: heightR/14,
              child:ChipsChoice<String>.multiple(
                value: tags,
                onChanged:(val)=>setState(()=>tags=val),
                choiceItems:C2Choice.listFrom<String, String>(
                  label:(i, v) => v,
                  source:Options,
                  value:(i, v) => v,
                  tooltip: (i, v) => v,
                ),
                choiceCheckmark: true,
                choiceStyle: C2ChipStyle.filled(
                  foregroundColor: Colors.white,
                  color:Colors.purple[100],
                  checkmarkColor: Colors.purple,
                  overlayColor: Colors.purple,
                  selectedStyle: const C2ChipStyle(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:const EdgeInsets.only(left:30,top:10),
            child: SizedBox(
                height: heightR/20,
                width: widthR,
                child: Text('Study',style: GoogleFonts.roboto(fontSize:22,color: Colors.black,fontWeight: FontWeight.bold),
                )
            )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Container(
              width: widthR,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                color: Colors.white,
                border: Border.all(color: Colors.black)
              ),
              child: DropdownButton(
                items:Study.map((time){
                    return DropdownMenuItem(
                        value: time,
                        child: Text(time)
                    );
                  }).toList(),
                dropdownColor: Colors.white,
                underline: const SizedBox(),
                isExpanded: true,
                icon: Icon(Icons.arrow_drop_down_sharp,color:Colors.purple[100],),
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87
                ),
                value: Study_choose??Study[0],
                onChanged:(newTime){
                  setState(() {
                    Study_choose = newTime;
                  });
                } ,
              ),
            ),
          ),
          Padding(
              padding:const EdgeInsets.only(left:30,top:10),
              child: SizedBox(
                  height: heightR/20,
                  width: widthR,
                  child: Text('Age',style: GoogleFonts.roboto(fontSize:22,color: Colors.black,fontWeight: FontWeight.bold),
                  )
              )
          ),
          Container(
            height: 80,
            width: widthR,
            child: SfRangeSlider(
              min: DateTime(15, 01,18),
              max: DateTime(30, 01, 31),
              dragMode: SliderDragMode.both,
              activeColor: Colors.purple[100],
              showLabels: true,
              interval: 2,
              dateIntervalType: DateIntervalType.years,
              dateFormat: DateFormat.y(),
              values: _values,
              enableTooltip: true,
              onChanged: (SfRangeValues newValues) {
                setState(() {
                  _values = newValues;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

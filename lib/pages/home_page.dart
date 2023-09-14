import 'package:app/const_value.dart';
import 'package:app/pages/profile_screen.dart';
import 'package:app/pages/swipe_card.dart';
import 'package:app/models/time_study.dart';
import 'package:app/services/database.dart';
import 'package:app/widgets/create_new_group.dart';
import 'package:provider/provider.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';
import 'package:app/Widgets/sidebar.dart';
import 'package:app/pages/calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:badges/badges.dart'as badges;
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';
import 'package:app/models/user.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String? _topModelData;
  int _selectedIndex=0;
  static List<Widget> widgetOptions = <Widget>[
    const SwipeCard(),
    const TableEventsExample(),
    const CreateNewGroup(),
    const Text('trang 3'),
    const ProfileScreen(),
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
    return MultiProvider(
      providers: [
        StreamProvider<List<TimeStudy>?>.value(value: DatabaseService().studyData, initialData:null)
      ],
      child: Scaffold(
          drawer: const SlideBar(),
          appBar: AppBar(
            forceMaterialTransparency:true,
            backgroundColor: Colors.white,
            title:SizedBox(
              height: 150,
              width: 210,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/icon_book.png'),
                    radius: 45,
                    backgroundColor: Colors.white,
                  ),
                  Text('Socium',style:Font().headingBlack),
                ],
              ),
            ),
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
                    var value=await showTopModalSheet<String?>(context,const TopModel());
                    setState(() {
                      _topModelData=value;
                    });
                  },
                  icon:Image.asset('assets/images/filter1.png',width:30,height:25,),)
            ],
          ),
          backgroundColor: Colors.white,
          body: Center(
            child: widgetOptions.elementAt(_selectedIndex),
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
                  icon: Icon(Icons.add,color:Colors.purple[100],),
                  tooltip: 'Create your group',
                  label: 'Create your group'
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
        ),
    );
  }
}
class TopModel extends StatefulWidget {
  const TopModel({super.key});
  @override
  State<TopModel> createState() => _TopModelState();
}

class _TopModelState extends State<TopModel> {
  int tag=1;
  List<String>study=['Online','Offline','Both of them'];
  List<String>optionsMath=['Calculus','Linear Algebra','Probability','Microeconomics','Macroeconomics','Development economics',];
  List<String>optionsTech=['Data Structures and Algorithms','Object Oriented Programming','Technical Programming'];
  List<String>optionsPolitically=['Philosophy of marxism and Leninism','Political economics of marxism and leninism','Scientific socialism','Scientific socialism'];
  List<String> tagsMath = ['Math'];
  List<String>tagsTech=['Tech'];
  SfRangeValues _values = SfRangeValues(DateTime(8, 01,18), DateTime(12, 01,20));
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
                  child: Text('Subject',style: GoogleFonts.roboto(fontSize:22,color: Colors.black,fontWeight: FontWeight.bold),
                  )
              )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:35),
            child: SizedBox(
              width: widthR,
              height: heightR/14,
              child:ChipsChoice<String>.multiple(
                value: tagsMath,
                onChanged:(val)=>setState(()=>tagsMath=val),
                choiceItems:C2Choice.listFrom<String, String>(
                  label:(i, v) => v,
                  source: optionsMath,
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
            padding: const EdgeInsets.symmetric(horizontal:35),
            child: SizedBox(
              width: widthR,
              height: heightR/14,
              child:ChipsChoice<String>.multiple(
                value: tagsTech,
                onChanged:(val)=>setState(()=>tagsTech=val),
                choiceItems:C2Choice.listFrom<String, String>(
                  label:(i, v) => v,
                  source: optionsTech,
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
            padding:const EdgeInsets.symmetric(horizontal: 35),
            child: ChipsChoice<int>.single(
              value: tag,
              onChanged: (val) => setState(() => tag = val),
              choiceItems: C2Choice.listFrom<int, String>(
                source: optionsPolitically,
                value: (i, v) => i,
                label: (i, v) => v,
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
          Padding(
              padding:const EdgeInsets.only(left:30,top:10),
              child: SizedBox(
                  height: heightR/40,
                  width: widthR,
                  child: Text('Time',style: GoogleFonts.roboto(fontSize:22,color: Colors.black,fontWeight: FontWeight.bold),
                  )
              )
          ),
          SizedBox(
            height: 80,
            width: widthR,
            child: SfRangeSlider(
              min: DateTime(5, 01,18),
              max: DateTime(24, 01, 31),
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

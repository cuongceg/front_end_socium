import 'dart:io';

import 'package:app/const_value.dart';
import 'package:app/models/time_study.dart';
import 'package:app/services/database.dart';
import 'package:app/widgets/create_new_group.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class SwipeCard extends StatefulWidget {
  const SwipeCard({super.key});

  @override
  State<SwipeCard> createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  Duration duration=const Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    double heightR=MediaQuery.of(context).size.height;
    double widthR=MediaQuery.of(context).size.width;
    Widget constListTileSizedBox(String asset,String child){
      return SizedBox(
          width: widthR,
          height: heightR/30,
          child:ListTile(
              leading: Image.asset(asset),
              title: Text(child,style:Font().bodyWhite,)
          )
      );
    }
    Widget constTextSizedBox(String child){
      return SizedBox(
          width: widthR,
          height: heightR/30,
          child: Text(child,style:Font().headingWhite,)
      );
    }
    addSwipeItems();//method add Items to swipeItems
    MatchEngine matchEngine = MatchEngine(swipeItems: _swipeItems);
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top:0),
        child:_swipeItems.isNotEmpty?SizedBox(
          height: heightR,
          width: widthR,
          child:ListView(
            children:[
              Stack(
                //draggable cards
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:30.0),
                  child: SizedBox(
                    height: heightR/1.6,
                    width: widthR,
                    child: SwipeCards(
                      matchEngine: matchEngine,
                      itemBuilder:(BuildContext context,int index){
                        return SizedBox(
                          height: heightR,
                          width: widthR,
                          child:Stack(
                            children: [
                              Center(
                                child:SizedBox(
                                  width: widthR/1.1,
                                  height: heightR/1.6,
                                  child: ClipRRect(
                                    // rounded corner image
                                    borderRadius: ConstValue().borderRadius,
                                      child: ShaderMask(
                                        // gradient layer
                                          shaderCallback: (bound) {
                                            return  LinearGradient(
                                                end: FractionalOffset.topCenter,
                                                begin: FractionalOffset.bottomCenter,
                                                colors: [
                                                  Colors.black.withOpacity(0.7),
                                                  Colors.black.withOpacity(0.5),
                                                  Colors.transparent,
                                                ],
                                                stops:const [0.0, 0.3, 0.7])
                                                .createShader(bound);
                                          },

                                          blendMode: BlendMode.srcOver,
                                          child:_swipeItems[index].content[7]==null? Image.asset('assets/images/swipe_image.png',fit:BoxFit.fill,) : Image.file(File((_swipeItems[index].content[7])),fit: BoxFit.fill,)
                                      )),
                                ),
                              ),
                              Positioned(
                                //information about group
                                left: 10,
                                top:heightR/3.8,
                                child: SizedBox(
                                  width: widthR/1.2,
                                  height: heightR/2.5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:const EdgeInsets.only(bottom:20,left:18),
                                        child:constTextSizedBox(_swipeItems[index].content[0])
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 18),
                                        child: SizedBox(
                                          width: widthR,
                                          height: heightR/30,
                                          child: Row(
                                            children: [
                                              for(int i=0;i<5;i++)Image.asset('assets/images/star.png'),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top:10.0),
                                        child:constListTileSizedBox('assets/images/classroom.png','Owner: ${_swipeItems[index].content[3]}')
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top:10.0),
                                        child:SizedBox(
                                            width: widthR,
                                            height: heightR/25,
                                            child:ListTile(
                                                leading: Image.asset('assets/images/clock.png'),
                                                title: Text('Time: Begin at ${_swipeItems[index].content[1]}:${_swipeItems[index].content[2]}',style:Font().bodyWhite,),
                                                subtitle: Text('In ${_swipeItems[index].content[6]}',style:Font().bodyWhite,)
                                            )
                                        )
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top:10.0),
                                        child:constListTileSizedBox('assets/images/books.png','Subject: ${_swipeItems[index].content[4]}')
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top:30.0,left: 18),
                                        child: constTextSizedBox('About group')
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:22),
                                        child: SizedBox(
                                            width: widthR,
                                            height: heightR/30,
                                            child: Text('${_swipeItems[index].content[5]}',style:Font().bodyWhite,)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        );
                      },
                      onStackFinished: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("You have watched all of group today",style:Font().bodyWhite,),
                          duration: const Duration(milliseconds: 500),
                        ));
                        setState(() {
                          _swipeItems.clear();
                        });
                      },
                      upSwipeAllowed: true,
                      fillSpace: true,
                    ),
                  ),
                )
              ],
            ),
              Padding(
                // button to participate or indifferent
                padding: const EdgeInsets.only(top: 0),
                child: SizedBox(
                  height: heightR/7,
                  width: widthR,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width:widthR/6,
                        height: heightR/6,
                        child: IconButton(
                            onPressed:(){
                              matchEngine.currentItem?.nope();
                            },
                            icon: Image.asset('assets/images/indifferent.png',fit: BoxFit.fill,)
                        ),
                      ),
                      SizedBox(
                        width:widthR/6,
                        height: heightR/6,
                        child: IconButton(
                          onPressed:(){
                            matchEngine.currentItem?.like();
                          },
                          icon: Image.asset('assets/images/love.png',fit: BoxFit.fill,),

                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]
          )
        ):Padding(
          //screen when watched all classes or don't find a suitable group
          padding: EdgeInsets.only(top:heightR/120),
          child: Container(
          width: widthR,
          height: heightR/4,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black,width: 2.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('There are currently no classes available.',style:Font().bodyBlack),
              Text('Refresh to find new group.',style:Font().bodyBlack),
              IconButton(
                  onPressed:(){
                      if(_swipeItems.isEmpty) {
                        //check new group
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Don't find a new group.", style:Font().bodyWhite,),
                          duration:duration,
                        ));
                      }
                  },
                  icon:Image.asset('assets/images/refresh.png',width: widthR/10,height: heightR/10,)),
              Text('Or create your group.',style:Font().bodyBlack),
              IconButton(
                  onPressed:(){
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>const CreateNewGroup()));
                  },
                  icon:Image.asset('assets/images/add-note.png'),
                   ),
            ],
          ),
      ),
        ),
      ),
    );
  }
  void addSwipeItems(){
    final studyList=Provider.of<List<TimeStudy>?>(context);
    _swipeItems=[];//reset list
    if(studyList!=null) {
      for (int i = studyList.length-1; i>-1; i--) {
        if(studyList[i].loading=='true'){
          DateFormat dateFormat=DateFormat('dd-MM-yyyy');
          String date=dateFormat.format(studyList[i].dateTime!);
          //check filter or watched
          List<String?>list1=[studyList[i].name,studyList[i].hour,studyList[i].minutes,studyList[i].owner,studyList[i].subjects,studyList[i].description,date,studyList[i].asset];
          setState(() {
            _swipeItems.add(SwipeItem(
              content: list1,
              likeAction: () {
                DatabaseService(uid: '$i').updateDatabase('${studyList[i].hour}','${studyList[i].minutes}','${studyList[i].name}','${studyList[i].owner}',"${studyList[i].subjects}",'false','${studyList[i].description}','Yes',studyList[i].dateTime,'${studyList[i].asset}','${studyList[i].uid}');
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Interested in ${studyList[i].subjects} of ${studyList[i].owner}",style:Font().bodyWhite,),
                  duration:duration,
                ));
              },
              nopeAction: () {
                DatabaseService(uid: '$i').updateDatabase('${studyList[i].hour}','${studyList[i].minutes}','${studyList[i].name}','${studyList[i].owner}',"${studyList[i].subjects}",'false','${studyList[i].description}','No',studyList[i].dateTime,'${studyList[i].asset}','${studyList[i].uid}');
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Indifferent in ${studyList[i].subjects} of ${studyList[i].owner}}",style:Font().bodyWhite,),
                  duration:duration,
                ));
              },
              superlikeAction: () {
                DatabaseService(uid: '$i').updateDatabase('${studyList[i].hour}','${studyList[i].minutes}','${studyList[i].name}','${studyList[i].owner}',"${studyList[i].subjects}",'false','${studyList[i].description}','Yes',studyList[i].dateTime,'${studyList[i].asset}','${studyList[i].uid}');
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Superliked ${studyList[i].subjects} of ${studyList[i].owner}}",style:Font().bodyWhite,),
                  duration:duration,
                ));
              },
            ));
          });
        }
      }
    }
  }
}

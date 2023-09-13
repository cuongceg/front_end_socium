import 'package:app/models/time_study.dart';
import 'package:app/services/database.dart';
import 'package:app/widgets/create_new_group.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:provider/provider.dart';


class SwipeCard extends StatefulWidget {
  const SwipeCard({super.key});

  @override
  State<SwipeCard> createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];

  @override
  Widget build(BuildContext context) {
    final body=GoogleFonts.roboto(fontSize: 19,color: Colors.white);
    final bodyBlack=GoogleFonts.roboto(fontSize: 19,color: Colors.black);
    final heading=GoogleFonts.roboto(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold);
    double heightR=MediaQuery.of(context).size.height;
    double widthR=MediaQuery.of(context).size.width;
    final studyList=Provider.of<List<TimeStudy>?>(context);
    _swipeItems=[];
    if(studyList!=null) {
      for (int i = studyList.length-1; i>-1; i--) {
          //check filter or watched
          if(studyList[i].loading=='true'){
            List<String?>list1=[studyList[i].name,studyList[i].hour,studyList[i].minutes,studyList[i].owner,studyList[i].subjects,studyList[i].description];
            setState(() {
              _swipeItems.add(SwipeItem(
                content: list1,
                likeAction: () {
                  DatabaseService(uid: '$i').updateDatabase('${studyList[i].hour}','${studyList[i].minutes}','${studyList[i].name}','${studyList[i].owner}',"${studyList[i].subjects}",'false','${studyList[i].description}','Yes');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Interested in ${studyList[i].subjects} of ${studyList[i].owner}",style: body,),
                    duration: const Duration(milliseconds: 500),
                  ));
                },
                nopeAction: () {
                  DatabaseService(uid: '$i').updateDatabase('${studyList[i].hour}','${studyList[i].minutes}','${studyList[i].name}','${studyList[i].owner}',"${studyList[i].subjects}",'false','${studyList[i].description}','No');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Indifferent in ${studyList[i].subjects} of ${studyList[i].owner}}",style: body,),
                    duration: const Duration(milliseconds: 500),
                  ));
                },
                superlikeAction: () {
                  DatabaseService(uid: '$i').updateDatabase('${studyList[i].hour}','${studyList[i].minutes}','${studyList[i].name}','${studyList[i].owner}',"${studyList[i].subjects}",'false','${studyList[i].description}','Yes');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Superliked ${studyList[i].subjects} of ${studyList[i].owner}}",style:body,),
                    duration: const Duration(milliseconds: 500),
                  ));
                },
              ));
            });
          }
      }
    }
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:60.0),
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
                                child: Container(
                                  width: widthR/1.1,
                                  height: heightR/1.6,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
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
                                                stops: [
                                                  0.0,
                                                  0.3,
                                                  0.7
                                                ])
                                                .createShader(bound);
                                          },

                                          blendMode: BlendMode.srcOver,
                                          child: Image.asset('assets/images/swipe_image.png',fit:BoxFit.fill,)
                                      )),
                                ),
                              ),
                              Positioned(
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
                                        child: SizedBox(
                                            width: widthR,
                                            height: heightR/30,
                                            child: Text(_swipeItems[index].content[0],style: heading,)
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 18),
                                        child: SizedBox(
                                          width: widthR,
                                          height: heightR/30,
                                          child: Row(
                                            children: [
                                              Image.asset('assets/images/star.png'),
                                              Image.asset('assets/images/star.png'),
                                              Image.asset('assets/images/star.png'),
                                              Image.asset('assets/images/star.png'),
                                              Image.asset('assets/images/star.png'),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top:10.0),
                                        child: SizedBox(
                                            width: widthR,
                                            height: heightR/30,
                                            child:ListTile(
                                                leading: Image.asset('assets/images/classroom.png'),
                                                title: Text('Owner: ${_swipeItems[index].content[3]}',style: body,)
                                            )
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top:10.0),
                                        child: SizedBox(
                                            width: widthR,
                                            height: heightR/30,
                                            child:ListTile(
                                                leading: Image.asset('assets/images/clock.png'),
                                                title: Text('Time: Begin at ${_swipeItems[index].content[1]}:${_swipeItems[index].content[2]}',style:body,)
                                            )
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top:10.0),
                                        child: SizedBox(
                                            width: widthR,
                                            height: heightR/30,
                                            child: ListTile(
                                                leading: Image.asset('assets/images/books.png'),
                                                title:Text('Subject: ${_swipeItems[index].content[4]}',style:body,)
                                            )
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top:30.0,left: 18),
                                        child: SizedBox(
                                            width: widthR,
                                            height: heightR/30,
                                            child: Text("About group:",style: heading,)
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:22),
                                        child: SizedBox(
                                            width: widthR,
                                            height: heightR/30,
                                            child: Text('${_swipeItems[index].content[5]}',style:body,)
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
                          content: Text("You have watched all of group today",style: body,),
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
              Text('There are currently no classes available.',style:bodyBlack),
              Text('Refresh to find new group.',style:bodyBlack),
              IconButton(
                  onPressed:(){
                      if(_swipeItems.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Don't find a new group.", style: body,),
                          duration: const Duration(milliseconds: 500),
                        ));
                      }
                  },
                  icon:Image.asset('assets/images/refresh.png',width: widthR/10,height: heightR/10,)),
              Text('Or create your group.',style:bodyBlack),
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
}

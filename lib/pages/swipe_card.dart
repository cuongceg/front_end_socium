import 'package:app/models/time_study.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:provider/provider.dart';
import 'package:swipe_cards/draggable_card.dart';

class SwipeCard extends StatefulWidget {
  const SwipeCard({super.key});

  @override
  State<SwipeCard> createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  @override
  Widget build(BuildContext context) {
    final medium=GoogleFonts.roboto(fontSize: 19,color: Colors.white);
    final heading=GoogleFonts.roboto(fontSize: 21,color: Colors.white,fontWeight: FontWeight.bold);
    double heightR=MediaQuery.of(context).size.height;
    double widthR=MediaQuery.of(context).size.width;
    final studyList=Provider.of<List<TimeStudy>?>(context);
    if(studyList!=null) {
      for (int i = 0; i < studyList.length; i++) {
        _swipeItems.add(SwipeItem(
          content: studyList[i],
          likeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Liked ${studyList[i].subjects} of ${studyList[i].owner}"),
              duration: const Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Nope ${studyList[i].subjects} of ${studyList[i].owner}}"),
              duration: const Duration(milliseconds: 500),
            ));
          },
          superlikeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Superliked ${studyList[i].subjects} of ${studyList[i].owner}}"),
              duration: const Duration(milliseconds: 500),
            ));
          },
        ));
      }
    }
    MatchEngine matchEngine = MatchEngine(swipeItems: _swipeItems);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top:heightR/15),
        child:SizedBox(
          height: heightR,
          width: widthR,
          child: ListView(
            children:[
              Stack(
              children: [
                SizedBox(
                  height: heightR/1.5,
                  width: widthR,
                  child: SwipeCards(
                    matchEngine: matchEngine,
                    itemBuilder:(BuildContext context,int index){
                      return SizedBox(
                        height: heightR/1.2,
                        width: widthR,
                        child:Stack(
                          children: [
                            Image.asset('assets/images/swipe_image.png'),
                            Positioned(
                                top: heightR/2.5,
                                left: 0,
                                child:SizedBox(
                                  width: widthR,
                                  height: heightR/4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:const EdgeInsets.only(bottom:20),
                                        child: SizedBox(
                                            width: widthR,
                                            height: heightR/30,
                                            child: Text(studyList==null?'Your owner':studyList[index].name!,style: heading,)
                                        ),
                                      ),
                                      SizedBox(
                                          width: widthR,
                                          height: heightR/30,
                                          child: Text('Owner: ${studyList==null?'Your owner':studyList[index].owner!}',style: medium,)
                                      ),
                                      SizedBox(
                                          width: widthR,
                                          height: heightR/30,
                                          child: Text('Time: Start ${studyList==null?'Your owner':studyList[index].hour!}-${studyList==null?'Your owner':studyList[index].minutes!}',style: medium,)),
                                      SizedBox(
                                        width: widthR,
                                        height: heightR/30,
                                        child: Text('Subject: ${studyList==null?'Your owner':studyList[index].subjects!}',style: medium,),
                                      ),
                                    ],
                                  ),
                                )
                            )
                          ],
                        ),
                      );
                    },
                    onStackFinished: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Stack Finished"),
                        duration: Duration(milliseconds: 500),
                      ));
                    },
                    upSwipeAllowed: true,
                    fillSpace: true,
                    likeTag: Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green)
                      ),
                      child: const Text('Like'),
                    ),
                    nopeTag: Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red)
                      ),
                      child: const Text('Nope'),
                    ),
                    superLikeTag: Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange)
                      ),
                      child: const Text('Super Like'),
                    ),
                  ),
                )
              ],
            ),
              SizedBox(
                height: heightR/20,
                width: widthR,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed:(){
                          matchEngine.currentItem?.nope();
                          },
                        icon: Image.asset('assets/images/indifferent.png')
                    ),
                    IconButton(
                        onPressed:(){
                          matchEngine.currentItem?.like();
                          },
                        icon: Image.asset('assets/images/participation_color.png')
                    )
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}

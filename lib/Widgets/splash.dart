import 'package:app/Login/SignIn.dart';
import 'package:app/Widgets/HomePage.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:size_config/size_config.dart';
class Myscreen extends StatefulWidget {
  const Myscreen({super.key});

  @override
  State<Myscreen> createState() => _MyscreenState();
}

class _MyscreenState extends State<Myscreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 4)).then((value){
      Get.to(Login());
    });
  }
  @override
  Widget build(BuildContext context) {
    double heightR=MediaQuery.of(context).size.height;
    double widthR=MediaQuery.of(context).size.width;
    return SizeConfigInit(
      referenceHeight: heightR,
      referenceWidth: widthR, builder: (BuildContext context, Orientation orientation) {
      return MaterialApp(
          home: Scaffold(
            body: SizedBox(
                width: widthR.w,
                height:heightR.h,
                child: Stack(children:[
                  FadeInDown(
                    child: Container(
                      width:widthR,
                      height:heightR/2,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple[200],
                          borderRadius:const BorderRadius.only(
                              bottomRight: Radius.circular(1000),
                              bottomLeft: Radius.circular(1000))),
                    ),
                    delay: const Duration(milliseconds: 500),),
                  Positioned(
                    top: 150.h,
                    left: 75.w,
                    child: FadeInUp(
                      delay: const Duration(milliseconds: 600),
                      child: SizedBox(
                        width: widthR/1.5,
                        height: heightR/10,
                        child: Center(
                          child: Text(
                            "CeG in your area",
                            style: GoogleFonts.bebasNeue(
                                color: Colors.white,
                                fontSize: 40.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 225,
                    left: 140,
                    child: FadeInUp(
                      delay: const Duration(milliseconds: 900),
                      child: Spin(
                        delay: const Duration(milliseconds: 1000),
                        child: SizedBox(
                          width: widthR/3,
                          height: heightR/3,
                          child: Center(child: Image.asset('assets/images/2.png',width:widthR,height: heightR,)),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 78,
                    child: FadeInUp(
                      delay: const Duration(milliseconds: 1300),
                      child: SizedBox(
                        width: widthR / 1.6,
                        height: heightR / 16,
                        child: Center(
                          child: Text(
                            "Wait a minutes...",
                            style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 200,
                    left: 75,
                    child: FadeInRight(
                      delay: const Duration(milliseconds: 1300),
                      child: SizedBox(
                        width: widthR / 3.5,
                        height: heightR /5,
                        child: Center(
                          child: Text(
                            "Study",
                            style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 35,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 200,
                    left: 145,
                    child: FadeInUp(
                      delay: const Duration(milliseconds: 1300),
                      child: SizedBox(
                        width: widthR / 4,
                        height: heightR /5,
                        child: Center(
                            child: Icon(Icons.monitor_heart,size: 50,color: Colors.purple[100],)
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 200,
                    right: 50,
                    child: FadeInLeft(
                      delay: const Duration(milliseconds: 1300),
                      child: SizedBox(
                        width: widthR /2.5,
                        height: heightR /5,
                        child: Center(
                          child: Text(
                            "Better",
                            style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 35,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 155,
                    child: FadeInUp(
                      delay: const Duration(milliseconds: 1500),
                      child: SizedBox(
                        width: widthR / 5,
                        height: heightR / 15,
                        child: Center(
                            child: SpinKitFoldingCube(
                              size: 35,
                              itemBuilder: (BuildContext context, int index) {
                                return  DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.purple[100],
                                  ),
                                );
                              },
                            )),
                      ),
                    ),
                  ),
                ],)
            ),
          )
      );
    },
    );
  }
}


import 'package:app/Login/SignIn.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:size_config/size_config.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';
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
      Get.to(()=>const Login());
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
                width: widthR,
                height:heightR,
                child: Stack(children:[
                  FadeInUp(
                    child: WaveWidget(
                    config: CustomConfig(
                    gradients: [
                      [Colors.white,Colors.purple],
                    [Colors.white,Colors.purple],
                      [Colors.white,Colors.white],
                    ],
                    durations: [3500,10000,6000],
                    heightPercentages:[0.35,0.45,0.75]
                ),
              size: Size(widthR,heightR),
            ),
                    delay: const Duration(milliseconds: 500),
                    duration: const Duration(milliseconds: 1000),),
                  Positioned(
                    top: 225,
                    left: widthR/3.15,
                    child: FadeInUp(
                      delay: const Duration(milliseconds: 900),
                        child: SizedBox(
                          width: widthR/3,
                          height: heightR/3,
                          child: Center(child: Image.asset('assets/images/2.png',width:widthR,height: heightR,)),
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
                    bottom: 150,
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
                    bottom: 150,
                    left: widthR/2.7,
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
                    bottom: 150,
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


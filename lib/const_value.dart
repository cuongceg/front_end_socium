import 'package:app/Login/sign_in.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Font{
  final bodyWhite=GoogleFonts.roboto(fontSize:19,color:Colors.white);
  final bodyBlack=GoogleFonts.roboto(fontSize: 19,color: Colors.black);
  final bodyError=GoogleFonts.roboto(fontSize:19,color: Colors.red);
  final headingBlack=GoogleFonts.roboto(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold);
  final headingWhite=GoogleFonts.roboto(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold);
  final headingPurple=GoogleFonts.roboto(fontSize: 25,color: Colors.purple[200],fontWeight: FontWeight.bold);
  final title=GoogleFonts.roboto(color: Colors.deepPurple,fontSize:40,fontWeight: FontWeight.bold);
  final title1=GoogleFonts.lato(color: Colors.black,fontSize: 45,fontWeight: FontWeight.bold);
}

class ConstAppBar{
  AppBar goBackToLogin(String title){
    return AppBar(
      backgroundColor: Colors.white,
      forceMaterialTransparency:true,
      leading: Builder(
          builder: (BuildContext context){
            return IconButton(
                icon:const Icon(Icons.arrow_back_rounded,size: 30,color: Colors.black,),
                onPressed: (){
                  Get.to(()=>const Login());
                }
            );
          }
      ),
      title: Text(title,style:Font().headingBlack)
    );
}
}

class ConstValue{
  BorderRadius borderRadius=BorderRadius.circular(40);
  BorderSide borderSidePurple=const BorderSide(color: Colors.deepPurple,width:2.0);
  BorderSide borderSideBlack=const BorderSide(color: Colors.black,width:2.0);
}

class ConstWigdet{
  Divider thinDivider(){
    return const Divider(
      height: 10,
      thickness: 0.5,
      color: Colors.black,
    );
  }
  Divider thickDivider(){
    return const Divider(
      height: 10,
      thickness:2,
      color: Colors.black,
    );
  }
  InputDecoration? inputDecoration(String label){
    return InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius:ConstValue().borderRadius,
            borderSide:ConstValue().borderSideBlack
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: ConstValue().borderRadius,
            borderSide:ConstValue().borderSidePurple
        ),
        fillColor: Colors.white,
        filled: true,
        labelText: label
    );
  }
}


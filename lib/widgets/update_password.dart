import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/const_value.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});
  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  String? email;
  final emailEditingController=TextEditingController();

  @override
  void dispose() {
    emailEditingController.dispose();
    super.dispose();
  }

  Future passwordReset() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailEditingController.text.trim());
    } on FirebaseAuthException catch(e){
      showDialog(
          context: context, builder:(context){
            return AlertDialog(
              content: Text(e.message.toString(),style: Font().bodyBlack,),
            );
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    double heightR=MediaQuery.of(context).size.height;
    double widthR=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency:true,
        leading: IconButton(
          icon:const Icon(Icons.arrow_back,size: 30,color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title:Text('Change Password',style:Font().headingBlack,),
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        height: heightR,
        width: widthR,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Enter an email and we send you a link to reset password.',style: Font().bodyBlack,)),
            Center(
                child:Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                      controller:emailEditingController ,
                      onChanged: (text){
                        setState(() {
                          email=text;
                        });
                        },
                      decoration:ConstWigdet().inputDecoration('Your email')
                   ),
                )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:20.0,horizontal:60),
              child: Container(
                width: widthR,
                decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.all(Radius.circular(40))
                ),
                child: TextButton(
                  child:Text('Reset password',style: Font().bodyWhite,),
                  onPressed: ()async{
                    await passwordReset();
                  },
                ),
              ),
            ),
          ],
        )
    )
    );
  }
}

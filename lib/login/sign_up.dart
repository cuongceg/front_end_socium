import 'package:app/Login/sign_in_with_username.dart';
import 'package:app/const_value.dart';
import 'package:flutter/material.dart';
import 'package:app/services/auth.dart';
import 'package:app/pages/loading_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:app/services/database.dart';
import 'package:app/models/user.dart';

class SignUp extends StatefulWidget{
  const SignUp({super.key});
  @override
  State<StatefulWidget> createState() {
    return MySignupState();
  }
}

class MySignupState extends State<SignUp>{
  bool loading=false;
  final AuthService auth=AuthService();
  final _formKey =GlobalKey<FormState>();
  String? firstName,userName,confirmpassword;
  String _email='',password='';
  final firstnameEditingController=TextEditingController();
  final usernameEditingController=TextEditingController();
  final emailEditingController=TextEditingController();
  final passwordEditingController=TextEditingController();
  final confirmpasswordEditingController=TextEditingController();
  bool hint=true;
  void toggleView(){
    // hint password or not
    hint =!hint;
  }

  @override
  Widget build(BuildContext context){
    double heightR=MediaQuery.of(context).size.height;
    double widthR=MediaQuery.of(context).size.width;
    return loading?const Loading():AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
       ),
      child:SafeArea(//use the color of status bar
        child: Scaffold(
          appBar: ConstAppBar().goBackToLogin('Sign up'),
          backgroundColor: Colors.white,
          body: Center(
              child:Form(
                key:_formKey,
                child:ListView(
                  children:<Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Already have account ?',
                                  style:Font().bodyBlack
                                ),
                                TextButton(
                                  onPressed:() =>
                                      Navigator.pop(context),
                                  child:Text(
                                    "Sign in",
                                    style:Font().headingPurple,
                                  ),
                                ),
                              ],
                            ),
                            inputNameText(),
                            inputUserNameText(),
                            inputEmail(),
                            inputPassword(),
                            inputConfirmPassword(),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20,horizontal:60),
                              child: Container(
                                height: 50,
                                width:widthR,
                                decoration: BoxDecoration(
                                  color: Colors.purple[800],
                                  borderRadius: const BorderRadius.all(Radius.circular(40))
                                ),
                                child: TextButton(
                                  onPressed:()async{
                                    if(_formKey.currentState!.validate()){
                                      MyUser? result=await auth.signUpEmail(_email, password);
                                      if(result == null){
                                        //check sign up successfully or not
                                        final snackBar = SnackBar(
                                          backgroundColor:Colors.purple[100],
                                          content: Text('Enter a valid email and try again',style: Font().bodyWhite,),
                                        );
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                      }
                                      else{
                                        // create a profile base on unique uid
                                        await DatabaseService(uid:result.uid).updateProfile(firstName, userName,'18','Ha Noi','Male','10.0','FPT',result.uid,null);
                                        showModalBottomSheet<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SizedBox(
                                              height:heightR/5,
                                              width: widthR,
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text('Sign up successfully',style:Font().headingBlack),
                                                    Padding(
                                                      padding: const EdgeInsets.all(20.0),
                                                      child: Container(
                                                        width: widthR/4,
                                                        height: heightR/15,
                                                        decoration: BoxDecoration(
                                                            borderRadius:ConstValue().borderRadius,
                                                            color: Colors.purple[800]
                                                        ),
                                                        child: TextButton(
                                                          child:Text('Sign in',style:Font().bodyWhite,),
                                                          onPressed: () => Get.to(()=>const LoginWithUsername()),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    }
                                  },
                                  child: const Text(
                                    "SIGN UP",
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:22),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
        ),
      ),
    );
  }
  Widget inputNameText(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        validator: (val) {
          if(val==null||val.isEmpty){
            return 'Enter your name';
          }
          else
          {return null;}
        },
        controller: firstnameEditingController,
        onChanged: (text){
          setState(() {
            firstName=text;
          });
        },
        decoration:ConstWigdet().inputDecoration('Your name')
      ),
    );
  }
  Widget inputUserNameText(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        validator: (val) {
          if(val==null||val.isEmpty){
            return 'Enter user name';
          }
          else
          {return null;}
        },
        controller: usernameEditingController,
        onChanged: (text){
          setState(() {
            userName=text;
          });
        },
        decoration:ConstWigdet().inputDecoration('Your username')
      ),
    );
  }
  Widget inputEmail(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        validator: (val) {
          if(val==null||val.isEmpty){
            return 'Enter a valid email';
          }
          else
          {return null;}
        },
        controller:emailEditingController,
        onChanged: (text){
          setState(() {
            _email=text;
          });
        },
        decoration:ConstWigdet().inputDecoration('Your email')
      ),
    );
  }
  Widget inputPassword(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        validator: (val) {
          if(val==null||val.length<6){
            return 'Enter password has more 6 lettters';
          }
          else
          {return null;}
        },
        obscureText: hint,
        controller: passwordEditingController,
        onChanged: (text){
          setState(() {
            password=text;
          });
        },
        decoration: inputPasswordDecoration('Your password'),
      ),
    );
  }
  Widget inputConfirmPassword(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        validator: (val) {
          if(val==null||val!=password){
            return 'Check out your master password and try again';
          }
          else
          {return null;}
        },
        obscureText: hint,
        controller: confirmpasswordEditingController,
        onChanged: (text){
          setState(() {
            confirmpassword=text;
          });
        },
        decoration: inputPasswordDecoration('Confirm your password'),
      ),
    );
  }
  InputDecoration? inputPasswordDecoration(String label){
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
        labelText:label,
        suffix: InkWell(
            child:hint?const Icon(Icons.remove_red_eye_outlined):const Icon(Icons.visibility_off_sharp),
            onTap:()async{
              setState(() {
                toggleView();
              });
            }
        ),
      );
  }
}
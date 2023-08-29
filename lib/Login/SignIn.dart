import 'package:app/Login/SignInWithUsername.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'SignUp.dart';
import 'package:app/Widgets/Loading.dart';
import 'package:app/Widgets/HomePage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
class Login extends StatefulWidget{
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login>{
  final _formkey =GlobalKey<FormState>();
  String _username='',_password='',error='';
  bool loading=false;
  final UserNameEditingController=TextEditingController();
  final passwordEditingController=TextEditingController();
  bool hint=true;
  void toggleView(){
    hint =!hint;
  }
  @override
  Widget build(BuildContext context){
    double heightR=MediaQuery.of(context).size.height;
    double widthR=MediaQuery.of(context).size.width;
    return loading?const Loading():AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.deepPurple[200],
      ),
      child:SafeArea(
            child: Scaffold(
              body: Center(
                  child:Form(
                      key: _formkey,
                      child:ListView(
                        children:<Widget>[
                          Container(
                            color: Colors.deepPurple[200],
                            width: widthR,
                            height: heightR/20,
                          ),
                          SizedBox(
                            height:heightR/4,
                            width: widthR/4,
                            child: Center(child: Image.asset('assets/images/2.png',width:widthR/3,height: heightR/3,)),
                          ),
                          Container(
                            color: Colors.deepPurple[200],
                            width: widthR,
                            height: heightR/6,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 40),
                            child: SizedBox(
                              height: heightR/13,
                              width: widthR/2,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: TextButton(
                                  onPressed:() async{
                                    setState(() {
                                      loading=true;
                                    });
                                    Get.to(() => const LoginWithUsername());
                                    // dynamic result= await _auth.signInemailandpassword(_email, _password);
                                    // if(result == null){
                                    //   setState(() => error ='Invalid email or wrong password,please try again!' );
                                    //   loading=false;
                                    //}
                                  },
                                  child:ListTile(
                                    title: Text(
                                        "LOGIN WITH USERNAME",
                                        style: GoogleFonts.roboto(color: Colors.black,
                                          fontSize: 18,)
                                    ),
                                    leading: const Icon(Icons.person,color: Colors.blue,),
                                  )
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 40),
                            child: SizedBox(
                              height: heightR/13,
                              width: widthR/2,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: TextButton(
                                    onPressed:() async{
                                      setState(() {
                                        loading=true;
                                      });
                                      await Get.to(() => const HomePage());
                                      // dynamic result= await _auth.signInemailandpassword(_email, _password);
                                      // if(result == null){
                                      //   setState(() => error ='Invalid email or wrong password,please try again!' );
                                      //   loading=false;
                                      //}
                                    },
                                    child:ListTile(
                                      title: Text(
                                          "LOGIN WITH FACEBOOK",
                                          style: GoogleFonts.roboto(color: Colors.black,
                                            fontSize: 18,)
                                      ),
                                      leading: const Icon(Icons.facebook,color: Colors.blue,),
                                    )
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 40),
                            child: SizedBox(
                              height: heightR/13,
                              width: widthR/2,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: TextButton(
                                    onPressed:() async{
                                      setState(() {
                                        loading=true;
                                      });
                                      await Get.to(() => const HomePage());
                                      // dynamic result= await _auth.signInemailandpassword(_email, _password);
                                      // if(result == null){
                                      //   setState(() => error ='Invalid email or wrong password,please try again!' );
                                      //   loading=false;
                                      //}
                                    },
                                    child:ListTile(
                                      title: Text(
                                          "LOGIN WITH GOOGLE",
                                          style: GoogleFonts.roboto(color: Colors.black,
                                            fontSize: 18,)
                                      ),
                                      leading: Image.asset('assets/images/google.png',width: 20,height: 20,),
                                    )
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              height: heightR/5,
                              width: widthR,
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Don\'t have account ?',
                                    style: GoogleFonts.roboto(color: Colors.white,fontSize: 22)
                                  ),
                                  TextButton(
                                      onPressed:() =>Get.to(()=>SignUp()),
                                      child: Text(
                                        "Sign up",
                                        style: GoogleFonts.roboto(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)
                                      ),
                                    ),
                                ],
                              ),
                            ),
                        ],
                      )
                  )
              ),
              backgroundColor: Colors.deepPurple[200],
      ),
      )
    );
  }
}
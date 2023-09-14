import 'package:app/pages/home_page.dart';
import 'package:app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/pages/loading_screen.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:app/const_value.dart';

class LoginWithUsername extends StatefulWidget{
  const LoginWithUsername({Key? key}) : super(key: key);

  @override
  _LoginWithUsernameState createState() => _LoginWithUsernameState();
}
class _LoginWithUsernameState extends State<LoginWithUsername>{
  AuthService auth=AuthService();
  String _username='',_password='',error='';
  final userNameEditingController=TextEditingController();
  final passwordEditingController=TextEditingController();
  bool hint=true;
  void toggleView(){
    hint =!hint;
  }
  @override
  Widget build(BuildContext context){
    double heightR=MediaQuery.of(context).size.height;
    double widthR=MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
        child:SafeArea(
          child: Scaffold(
            appBar:ConstAppBar().goBackToLogin('Login with email and password'),
            body: Center(
                child:ListView(
                  children:<Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal:widthR/13),
                      child: TextField(
                          controller: userNameEditingController,
                          onChanged: (text){
                            setState(() {
                              _username=text;
                            });
                            },
                          decoration: inputDecoration()
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.deepPurple[300],
                      indent: widthR/10,
                      endIndent: widthR/10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal:widthR/13),
                      child: TextField(
                          controller:passwordEditingController ,
                          obscureText: hint,
                          onChanged: (text){
                            setState(() {
                              _password=text;
                            });
                            },
                          decoration:inputPasswordDecoration()
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.deepPurple[200],
                      indent: widthR/10,
                      endIndent: widthR/10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10,top: 5),
                      child: SizedBox(height: 12.0,width: 30.0),
                    ),
                    Text(error,style: Font().bodyError,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 40),
                      child: SizedBox(
                        height: heightR/13,
                        width: widthR/2,
                        child: Container(
                          decoration:BoxDecoration(
                              color: Colors.deepPurple[300],
                              borderRadius: const BorderRadius.all(Radius.circular(40))
                          ),
                          child: TextButton(
                            onPressed:() async{
                              dynamic result= await auth.signInemailandpassword(_username, _password);
                              if(result == null){
                                //check gmail or password right or wrong
                                setState(() => error ='Invalid email or wrong password,please try again!' );
                              }
                              else{
                                Get.to(()=>const HomePage());
                              }
                              },
                            child:Text(
                                "LOGIN",
                                style: GoogleFonts.roboto(color: Colors.white,fontSize: 18,)
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            backgroundColor: Colors.white,
          ),
        )
    );
  }
  InputDecoration inputDecoration(){
    return const InputDecoration(
        enabledBorder:OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder:OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        fillColor: Colors.white,
        filled: true,
        labelText:'Email'
    );
  }
  InputDecoration inputPasswordDecoration(){
    return InputDecoration(
        enabledBorder:const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder:const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        fillColor: Colors.white,
        filled: true,
        labelText:'Password',
        suffix: InkWell(
          child:hint?const Icon(Icons.remove_red_eye_outlined):const Icon(Icons.visibility_off),
          onTap:()async{
            setState(() {
              toggleView();
            });
          }),
    );
  }
}
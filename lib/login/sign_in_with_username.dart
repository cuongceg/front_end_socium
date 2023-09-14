import 'package:app/pages/home_page.dart';
import 'package:app/services/auth.dart';
import 'package:app/widgets/update_password.dart';
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
  String _username='',_password='';
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20,top: 10,right:15),
                          child: GestureDetector(
                            onTap:(){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>const UpdatePassword()));
                            },
                            child: Text('Forgot Password ?',style:GoogleFonts.roboto(color:Colors.blue,fontSize:19,fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:10,horizontal:60),
                      child: SizedBox(
                        height: heightR/16,
                        width: widthR,
                        child: Container(
                          decoration:BoxDecoration(
                              color: Colors.purple[800],
                              borderRadius: const BorderRadius.all(Radius.circular(40))
                          ),
                          child: TextButton(
                            onPressed:() async{
                              dynamic result= await auth.signInemailandpassword(_username, _password);
                              if(result == null){
                                //check gmail or password right or wrong
                                final snackBar = SnackBar(
                                  backgroundColor:Colors.purple[100],
                                  content: Text('Invalid email or wrong password!',style: Font().bodyWhite,),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                              else{
                                Get.to(()=>const HomePage());
                              }
                              },
                            child:Text(
                                "LOGIN",
                                style: GoogleFonts.roboto(color: Colors.white,fontSize:22,)
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
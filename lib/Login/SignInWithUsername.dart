import 'package:app/Login/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/Widgets/Loading.dart';
import 'package:app/Widgets/HomePage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
class LoginWithUsername extends StatefulWidget{
  const LoginWithUsername({Key? key}) : super(key: key);

  @override
  _LoginWithUsernameState createState() => _LoginWithUsernameState();
}
class _LoginWithUsernameState extends State<LoginWithUsername>{
  final _formkey =GlobalKey<FormState>();
  String _username='',_password='',error='';
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
        child:SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back,color: Colors.black,),
                iconSize: 28,
                onPressed: (){
                  Get.to(()=>const Login());
                },
              ),
            ),
            body: Center(
                child:Form(
                    key: _formkey,
                    child:ListView(
                      children:<Widget>[
                        Text('Log in with username',style: GoogleFonts.roboto(fontSize: 33,color: Colors.black,fontWeight: FontWeight.bold),),
                        Container(
                          color: Colors.white,
                          height: heightR/20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal:widthR/13),
                          child: TextFormField(
                            controller: UserNameEditingController,
                            onChanged: (text){
                              setState(() {
                                _username=text;
                              });
                              },
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20)),
                                    borderSide: BorderSide(color: Colors.white,width:2.0)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20)),
                                    borderSide: BorderSide(color: Colors.white,width:2.0)
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                labelText:'User name'
                            ),
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
                          child: TextFormField(
                            controller:passwordEditingController ,
                            obscureText: hint,
                            onChanged: (text){
                              setState(() {
                                _password=text;
                              });
                              },
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.white,width:2.0)
                              ),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.white,width:2.0)
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              labelText:'Password',
                              suffix: IconButton(
                                  icon:hint?const Icon(Icons.remove_red_eye_outlined):const Icon(Icons.visibility_off),
                                  onPressed:()async{
                                    setState(() {
                                      toggleView();
                                    });
                                  }),
                            ),
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
                        Text(
                          error,
                          style: TextStyle(
                              color: Colors.red[500],
                              fontSize: 14
                          ),
                        ),
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
                                    setState(() {
                                    });
                                    await Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                                    // dynamic result= await _auth.signInemailandpassword(_email, _password);
                                    // if(result == null){
                                    //   setState(() => error ='Invalid email or wrong password,please try again!' );
                                    //   loading=false;
                                    //}
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
                    )
                )
            ),
            backgroundColor: Colors.white,
          ),
        )
    );
  }
}
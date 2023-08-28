import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'SignUp.dart';
import 'package:app/Widgets/Loading.dart';
import 'package:app/Widgets/HomePage.dart';
import 'package:flutter/services.dart';
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
                          SizedBox(
                            height:heightR/4,
                            width: widthR/4,
                            child: Center(child: Image.asset('assets/images/2.png',width:widthR/3.5,height: heightR/3.5,)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
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
                                        borderSide: BorderSide(color: Colors.deepPurple,width:2.0)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(color: Colors.deepPurple,width:2.0)
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    labelText:'User name'
                                ),
                              ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SizedBox(
                              height: heightR/13,
                              width: widthR,
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
                                      borderSide: BorderSide(color: Colors.deepPurple,width:2.0)
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)),
                                      borderSide: BorderSide(color: Colors.deepPurple,width:2.0)
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
                                      }
                                  ),
                                ),
                              ),
                            ),
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
                              height: heightR/15,
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
                                    await Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                                    // dynamic result= await _auth.signInemailandpassword(_email, _password);
                                    // if(result == null){
                                    //   setState(() => error ='Invalid email or wrong password,please try again!' );
                                    //   loading=false;
                                    //}
                                  },
                                  child:Text(
                                    "Login",
                                    style: GoogleFonts.roboto(color: Colors.black,
                                      fontSize: 25,)
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              height: heightR/5,
                              width: widthR,
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    'Don\'t have account ?',
                                    style: GoogleFonts.roboto(color: Colors.white,fontSize: 22)
                                  ),
                                  TextButton(
                                      onPressed:() =>
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp())),
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
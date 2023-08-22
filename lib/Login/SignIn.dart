import 'package:flutter/material.dart';
import 'SignUp.dart';
import 'package:app/Widgets/Loading.dart';
import 'package:app/Widgets/HomePage.dart';
class Login extends StatefulWidget{
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login>{
  final _formkey =GlobalKey<FormState>();
  String _email='',_password='',error='';
  bool loading=false;
  final emailEditingController=TextEditingController();
  final passwordEditingController=TextEditingController();
  bool hint=true;
  void toggleView(){
    hint =!hint;
  }
  @override
  Widget build(BuildContext context){
    double heightR=MediaQuery.of(context).size.height;
    double widthR=MediaQuery.of(context).size.width;
    return loading?const Loading():MaterialApp(
        title: 'Sign in',
        home:SafeArea(
          child: Scaffold(
            body: Center(
                child:Form(
                    key: _formkey,
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:<Widget>[
                        Container(
                          height:heightR/4,
                          width: widthR/4,
                          child: Center(child: Image.asset('assets/images/2.png',width:widthR,height: heightR,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            controller: emailEditingController,
                            onChanged: (text){
                              setState(() {
                                _email=text;
                              });
                            },
                            decoration: InputDecoration(
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
                                labelText:'Email address'
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
                                labelText:'Password',
                                suffix: IconButton(
                                    icon:hint?Icon(Icons.remove_red_eye_outlined):Icon(Icons.visibility_off),
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
                        SizedBox(
                          height: heightR/15,
                          width: widthR/2,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.deepPurple[300],
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
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0,top:0.0),
                          child: SizedBox(
                            height: heightR/5,
                            width: widthR,
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                const Text(
                                  'Don\'t have account ?',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20
                                  ),
                                ),
                                SizedBox(
                                  height: heightR/2,
                                  width: widthR/4,
                                  child: TextButton(
                                    onPressed:() =>
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp())),
                                    child: Text(
                                      "Sign up",
                                      style: TextStyle(
                                          color: Colors.deepPurple[300],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                )
            ),
            backgroundColor: Colors.deepPurple[50],
          ),
        )
    );
  }
}
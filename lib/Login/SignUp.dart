import 'package:flutter/material.dart';
// import 'package:lab/services/auth.dart';
//import 'package:app/Widgets/HomePage.dart';
import 'package:app/Widgets/Loading.dart';
import 'package:get/get.dart';
import 'package:app/Login/SignIn.dart';
class SignUp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MySignupState();
  }
}
class MySignupState extends State<SignUp>{
  bool hint=true;
  bool loading=false;
  // final AuthService _auth=AuthService();
  final _formKey =GlobalKey<FormState>();
  String? first_name,user_name,confirmpassword;
  String _email='';
  String password='';
  String error='';
  void toggleView(){
    hint =!hint;
  }
  final firstnameEditingController=TextEditingController();
  final usernameEditingController=TextEditingController();
  final emailEditingController=TextEditingController();
  final passwordEditingController=TextEditingController();
  final confirmpasswordEditingController=TextEditingController();
  @override
  Widget build(BuildContext context){
    double heightR=MediaQuery.of(context).size.height;
    double widthR=MediaQuery.of(context).size.width;
    return loading?const Loading():MaterialApp(
        home:SafeArea(
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.purple[50],
                leading: Builder(
                    builder: (BuildContext context){
                      return IconButton(
                          icon:const Icon(Icons.arrow_back_rounded,size: 30,),
                          onPressed: (){
                            Get.to(()=>const Login());
                          }
                      );
                    }
                ),
                title: const Text('Sign up',style:TextStyle(
                    color:Colors.white ,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                )),
              ),
            backgroundColor: Colors.deepPurple[50],
              body: Center(
                  child:Form(
                    key:_formKey,
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:<Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Already have account ?',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 25
                              ),
                            ),
                            TextButton(
                              onPressed:() =>
                                  Navigator.pop(context),
                              child:Text(
                                "Sign in",
                                style: TextStyle(
                                    color: Colors.purple[200],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          validator: (val) {
                            if(val==null||val.isEmpty){
                              return 'Enter first name';
                            }
                            else
                            {return null;}
                          },
                          controller: firstnameEditingController,
                          onChanged: (text){
                            setState(() {
                              first_name=text;
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
                              labelText:'Name'
                          ),
                        ),
                        TextFormField(
                          validator: (val) {
                            if(val==null||val.isEmpty){
                              return 'Enter school';
                            }
                            else
                            {return null;}
                          },
                          controller: usernameEditingController,
                          onChanged: (text){
                            setState(() {
                              user_name=text;
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
                              labelText:'User Name'
                          ),
                        ),
                        TextFormField(
                          validator: (val) {
                            if(val==null||val.isEmpty){
                              return 'Enter an user name';
                            }
                            else
                            {return null;}
                          },
                          controller: emailEditingController,
                          onChanged: (text){
                            setState(() {
                              _email=text;
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
                              labelText:'Email address'
                          ),
                        ),
                        SizedBox(
                          height: heightR/13,
                          width: widthR,
                          child: TextFormField(
                            controller:passwordEditingController ,
                            obscureText: hint,
                            onChanged: (text){
                              setState(() {
                                password=text;
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
                        SizedBox(
                          width: widthR,
                          height: heightR/13,
                          child: TextFormField(
                            validator: (val) {
                              if(password != val){
                                return 'check your master password and try again';
                              }
                              else{return null;}
                            },
                            controller: confirmpasswordEditingController,
                            obscureText: hint,
                            onChanged: (text){
                              setState(() {
                                confirmpassword=text;
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
                              labelText:'Confirm password',
                              suffix: IconButton(
                                  icon:hint?const Icon(Icons.remove_red_eye_outlined):const Icon(Icons.hide_source_sharp),
                                  onPressed:()async{
                                    setState(() {
                                      toggleView();
                                    });
                                  }
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width:200,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple[300],
                          ),
                          child: TextButton(
                            onPressed:()async{
                              // if(_formKey.currentState!.validate()){
                              //   //dynamic result=await _auth.signupemailandpassword(_email, password);
                              //   if(result == null){
                              //     setState(() => error ='Please sign up a valid email and try again!' );
                              //   }
                              //   else{
                              //     await Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                              //   }
                              // }
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: SizedBox(height: 12.0,width: 30.0),
                        ),
                        Text(
                          error,
                          style: TextStyle(
                              color: Colors.red[500],
                              fontSize: 14
                          ),
                        )
                      ],
                    ),
                  )
              )
          ),
        )
    );
  }
}
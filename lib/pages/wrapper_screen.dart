import 'package:app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/Widgets/home_page.dart';
import 'package:app/Login/sign_in.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user =Provider.of<MyUser?>(context);
    if(user==null){
      return const Login();
          }
    else{
      return const HomePage();
          }
  }
}


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/models/user.dart';
class ProfileScreen extends StatelessWidget {
  final User? user;
  const ProfileScreen({this.user,super.key});
  @override
  Widget build(BuildContext context) {
    double heightR=MediaQuery.of(context).size.height;
    double widthR=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: ListView(
          children: [
            imageProfile(),
            SizedBox(
              width: widthR,
              height: heightR/13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('10 Posts      ',style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold)),
                  Text('609 Likes      ',style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold)),
                  Text('3 Friends',style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold))
                ],
              ),
            ),
            const Divider(
              height: 10,
              thickness: 2,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: widthR/2,
                height: heightR/15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                ),
                child: Center(
                    child:ListTile(
                        leading:const Icon(Icons.home),
                        title: Text('609 Trương Định,Thịnh Liệt,Hoàng Mai,Hà Nội',style: GoogleFonts.roboto(fontSize: 16)),
                    )),
              ),
            ),
            const Divider(
              height: 10,
              thickness: 0.5,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: widthR/2,
                height: heightR/15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                ),
                child: Center(
                    child:ListTile(
                      leading:const Icon(Icons.people),
                      title: Text('Male,19 years old',style: GoogleFonts.roboto(fontSize: 16))
                    )),
              ),
            ),
            const Divider(
              height: 10,
              thickness: 0.5,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: widthR/2,
                height: heightR/15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                ),
                child: Center(
                    child:ListTile(
                        leading:const Icon(Icons.school),
                        title: Text('Hanoi University of Science and Technology',style: GoogleFonts.roboto(fontSize: 16))
                    )),
              ),
            ),
            const Divider(
              height: 10,
              thickness: 0.5,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: widthR/2,
                height: heightR/16,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                ),
                child: Center(
                    child:ListTile(
                        leading:const Icon(Icons.grade),
                        title: Text('CPA:4.0',style: GoogleFonts.roboto(fontSize: 18))
                    )),
              ),
            ),
            const Divider(
              height: 10,
              thickness: 0.5,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: widthR/2,
                height: heightR/16,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                ),
                child: Center(
                    child:ListTile(
                        leading:const Icon(Icons.phone),
                        title: Text('0985976571',style: GoogleFonts.roboto(fontSize: 18))
                    )),
              ),
            ),
            const Divider(
              height: 10,
              thickness: 0.5,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: widthR/2,
                height: heightR/16,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                ),
                child: Center(
                    child:ListTile(
                        leading:const Icon(Icons.email),
                        title: Text('Cuong.dm225172@sis.hust.edu.vn',style: GoogleFonts.roboto(fontSize: 18))
                    )),
              ),
            ),
            const Divider(
              height: 10,
              thickness: 0.5,
              color: Colors.white,
            ),
          ],
        ),
    );
  }
  Widget imageProfile(){
    return const Center(
      child: CircleAvatar(
        radius:80.0,
        backgroundImage:AssetImage('assets/images/avatarimage.png'),
      ),
    );
  }
}


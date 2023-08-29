import 'dart:io';
import 'package:app/Widgets/HomePage.dart';
import 'package:app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
class MyProfileWidget extends StatefulWidget {
  const MyProfileWidget({super.key});
  @override
  State<MyProfileWidget> createState() => _MyProfileWidgetState();
}
class _MyProfileWidgetState extends State<MyProfileWidget>with TickerProviderStateMixin{
  late AnimationController controller;
  bool load=false;
  String? address,_email,_password,_confirmpassword,school,age,cpa;
  String? gender_choose;
  bool hint =true;
  File ? _selectedImage;
  void toggleView(){
    hint =!hint;
  }
  List<String>GenderList=['Male','Female','No option'];
  final emailEditingController=TextEditingController();
  final adressEditingController=TextEditingController();
  final passwordEditingController=TextEditingController();
  final confirmpasswordEditingController=TextEditingController();
  final schoolEditingController=TextEditingController();
  final ageEditingController=TextEditingController();
  final cpaEditingController=TextEditingController();
  final _formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double heightR=MediaQuery.of(context).size.height;
    double widthR=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon:const Icon(Icons.arrow_back,size: 30,color: Colors.black,),
            onPressed: (){
              Get.to(()=>const HomePage());
            },
        ),
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formkey,
          child: ListView(
            children: [
              imageProfile(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: adressEditingController,
                  onChanged: (text){
                    setState(() {
                      address=text;
                    });
                  },
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.black,width:2.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.deepPurple,width:2.0)
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      labelText:'Adress'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: heightR/14,
                  decoration:BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    children: [
                      const Text('  Gender: '),
                      SizedBox(
                        width: widthR/4.5,
                        height: heightR/19,
                        child: DropdownButton(
                          dropdownColor: Colors.white,
                          underline: const SizedBox(),
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87
                          ),
                          value: gender_choose??GenderList[0],
                          onChanged:(newGender){
                            setState(() {
                              gender_choose = newGender;
                            });
                          } ,
                          items: GenderList.map((gender){
                            return DropdownMenuItem(
                              value: gender,
                              child: Text(gender),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: ageEditingController,
                  onChanged: (text){
                    setState(() {
                      age=text;
                    });
                  },
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.black,width:2.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.deepPurple,width:2.0)
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      labelText:'Age'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: schoolEditingController,
                  onChanged: (text){
                    setState(() {
                      school=text;
                    });
                  },
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.black,width:2.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.deepPurple,width:2.0)
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      labelText:'School'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: cpaEditingController,
                  onChanged: (text){
                    setState(() {
                      cpa=text;
                    });
                  },
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.black,width:2.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.deepPurple,width:2.0)
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      labelText:'CPA'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
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
                          borderSide: BorderSide(color: Colors.black,width:2.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.deepPurple,width:2.0)
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    labelText:'Email Address'
                                ),
                              ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:10.0,horizontal:60),
                child: Container(
                  width: widthR/13,
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: TextButton(
                    child:Text(
                      'SAVE',
                      style: GoogleFonts.roboto(fontSize: 20,color:Colors.white)
                    ),
                    onPressed: (){
                      User(_email,address,school, age, cpa,gender_choose);
                      final snackBar = SnackBar(
                        backgroundColor:Colors.purple[100],
                        content: const Text('Wait a minutes...'),
                        action: SnackBarAction(
                          label: 'Undo',
                          textColor: Colors.black,
                          onPressed: () {
                            setState(() {
                              load=true;
                            });
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      if(load==false){
                        Future.delayed(const Duration(milliseconds: 4650)).then((value){
                          Navigator.pop(context);
                        });
                      }
                      },
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
  Widget imageProfile(){
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
                radius:80.0,
                backgroundImage:_selectedImage==null?const AssetImage('assets/images/avatarimage.png'):FileImage(File(_selectedImage!.path))as ImageProvider ,
              ),
          Positioned(
            top:120,
            left:113,
            child: InkWell(
              onTap: (){
                Get.defaultDialog(title:'Choose Profile photo',
                  middleText:'Add from:',
                  confirm:TextButton.icon(
                    icon: Icon(Icons.image,color: Colors.deepPurple[200],),
                    onPressed: (){
                      _pickImageFromGallery();
                    },
                    label: Text('Gallery',style:TextStyle(color: Colors.deepPurple[200])),
                  ),
                  cancel:TextButton.icon(
                      onPressed: (){
                        _pickImageFromCamera();
                      },
                      icon:Icon(Icons.camera,color: Colors.deepPurple[200],),
                      label:Text('Camera',style:TextStyle(color: Colors.deepPurple[200]))
                  )
                );
              },
              child: Icon(
                Icons.camera_alt,
                size: 25,
                color: Colors.deepPurple[200],
              ),
            ),
          )
        ],
      ),
    );
  }
  Future _pickImageFromGallery()async{
    final returnedImage= await ImagePicker().pickImage(source: ImageSource.gallery);
    if(returnedImage == null)return;
    setState(() {
      _selectedImage=File(returnedImage.path);
    });
  }
  Future _pickImageFromCamera()async{
    final returnedImage= await ImagePicker().pickImage(source: ImageSource.camera);
    if(returnedImage == null)return;
    setState(() {
      _selectedImage=File(returnedImage.path);
    });
  }
}

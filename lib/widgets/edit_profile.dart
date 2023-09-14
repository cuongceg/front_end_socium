import 'dart:io';
import 'package:app/models/user.dart';
import 'package:app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:app/const_value.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfileWidget extends StatefulWidget {
  const MyProfileWidget({super.key});
  @override
  State<MyProfileWidget> createState() => _MyProfileWidgetState();
}

class _MyProfileWidgetState extends State<MyProfileWidget>with TickerProviderStateMixin{
  int index=0;
  late AnimationController controller;
  bool load=false;
  String? address,school,age,cpa,name,username;
  String? genderChoose;
  bool hint =true;
  File ? _selectedImage;
  String? imagePath;

  void toggleView(){
    hint =!hint;
  }

  List<String>genderList=['Choose your gender','Male','Female','No option'];
  final nameEditingController=TextEditingController();
  final usernameEditingController=TextEditingController();
  final emailEditingController=TextEditingController();
  final adressEditingController=TextEditingController();
  final schoolEditingController=TextEditingController();
  final ageEditingController=TextEditingController();
  final cpaEditingController=TextEditingController();
  final _formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double heightR=MediaQuery.of(context).size.height;
    double widthR=MediaQuery.of(context).size.width;
    final user=Provider.of<MyUser?>(context);
    final authList=Provider.of<List<Auth>?>(context);
    for(int i=0;i<authList!.length;i++){
      if(authList[i].uid==user!.uid){
        index=i;
      }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency:true,
        leading: IconButton(
            icon:const Icon(Icons.arrow_back,size: 30,color: Colors.black,),
            onPressed: (){
              Navigator.pop(context);
            },
        ),
      ),
      body: Form(
        key: _formkey,
          child: ListView(
            children: [
              imageProfile(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                child: TextFormField(
                  controller: nameEditingController,
                  onChanged: (text){
                    setState(() {
                      name=text;
                    });
                  },
                  decoration: ConstWigdet().inputDecoration('Your name')
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                child: TextFormField(
                  controller: usernameEditingController,
                  onChanged: (text){
                    setState(() {
                      username=text;
                    });
                  },
                  decoration: ConstWigdet().inputDecoration('Your user name ?')
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                child: Container(
                  height: heightR/14,
                  decoration:BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.circular(40)
                  ),
                  child: Row(
                    children: [
                      const Text('  Gender: '),
                      SizedBox(
                        width: widthR/1.4,
                        height: heightR/19,
                        child: DropdownButton(
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_drop_down,size: 30,),
                          underline: const SizedBox(),
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87
                          ),
                          value: genderChoose??genderList[0],
                          onChanged:(newGender){
                            setState(() {
                              genderChoose = newGender;
                            });
                          } ,
                          items: genderList.map((gender){
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                child: TextFormField(
                  controller: ageEditingController,
                  onChanged: (text){
                    setState(() {
                      age=text;
                    });
                  },
                  decoration: ConstWigdet().inputDecoration('Age')
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                child: TextFormField(
                  controller: adressEditingController,
                  onChanged: (text){
                    setState(() {
                      address=text;
                    });
                  },
                  decoration:  ConstWigdet().inputDecoration('Adress ?'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                child: TextFormField(
                  controller: schoolEditingController,
                  onChanged: (text){
                    setState(() {
                      school=text;
                    });
                  },
                  decoration:  ConstWigdet().inputDecoration('School ?')
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                child: TextFormField(
                  controller: cpaEditingController,
                  onChanged: (text){
                    setState(() {
                      cpa=text;
                    });
                  },
                  decoration:  ConstWigdet().inputDecoration('CPA ')
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:20.0,horizontal:60),
                child: Container(
                  width: widthR/13,
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.all(Radius.circular(40))
                  ),
                  child: TextButton(
                    child:Text(
                      'SAVE',
                      style: GoogleFonts.roboto(fontSize: 20,color:Colors.white)
                    ),
                    onPressed: (){
                      imagePath=_selectedImage!=null?_selectedImage?.path:authList[index].asset;
                      DatabaseService(uid:user!.uid).updateProfile(name, username,age,address, genderChoose, cpa, school,user.uid,imagePath);
                      final snackBar = SnackBar(
                        backgroundColor:Colors.purple[100],
                        content: const Text('Wait a minutes...'),
                        action: SnackBarAction(
                          label: 'Undo',
                          textColor: Colors.black,
                          onPressed: () {
                            setState(() {
                              Get.to(()=>const MyProfileWidget());
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
          imagePath!=null?CircleAvatar(
           radius: 80,
           backgroundImage: FileImage(File(imagePath!)),
          ):CircleAvatar(
                radius:80.0,
                backgroundImage:_selectedImage==null?const AssetImage('assets/images/default_avatar1.png'):FileImage(File(_selectedImage!.path))as ImageProvider ,
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
                color: Colors.blue,
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
    var returnedImage= await ImagePicker().pickImage(source: ImageSource.camera);
    if(returnedImage == null)return;
    setState(() {
      _selectedImage=File(returnedImage.path);
    });
  }

}

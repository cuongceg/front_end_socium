import 'dart:io';
import 'package:app/widgets/update_group.dart';
import 'package:app/widgets/update_password.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:app/const_value.dart';
import 'package:app/models/user.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/models/time_study.dart';
import 'package:intl/intl.dart';

class CreateNewGroup extends StatefulWidget {
  const CreateNewGroup({super.key});

  @override
  State<CreateNewGroup> createState() => _CreateNewGroupState();
}

class _CreateNewGroupState extends State<CreateNewGroup> {
  String? groupName,hour,minutes,owner,subject,description,asset;
  File ? _selectedImage;
  final groupNameEditingController=TextEditingController();
  final hourEditingController=TextEditingController();
  final minutesEditingController=TextEditingController();
  final ownerEditingController=TextEditingController();
  final descriptionEditingController=TextEditingController();
  final dateEditingController=TextEditingController();
  final formKey=GlobalKey<FormState>();
  DateTime? date;
  List<String>optionsSubjects=['Choose a subject','Calculus','Linear Algebra','Probability','Microeconomics','Macroeconomics','Development economics','Data Structures and Algorithms','Object Oriented Programming','Technical Programming'];
  @override
  Widget build(BuildContext context) {
    double widthR=MediaQuery.of(context).size.width;
    double heightR=MediaQuery.of(context).size.height;
    final studyList=Provider.of<List<TimeStudy>?>(context);
    final user=Provider.of<MyUser?>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
          key: formKey,
          child: ListView(
            children: [
              Center(
                child: Padding(
                  padding:const EdgeInsets.symmetric(vertical: 15),
                  child:Text('Create and Custom your group',style: Font().headingBlack),
                ),
              ),
              Center(
                child: Padding(
                  padding:const EdgeInsets.symmetric(vertical: 5),
                  child:Text('Choose your image or use the default image',style:Font().bodyBlack ),
                ),
              ),
              imageCreate(widthR,heightR),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  validator: (val) {
                    if(val==null||val.isEmpty){
                      return 'Enter your group name';
                    }
                    else
                    {return null;}
                  },
                  controller: groupNameEditingController,
                  onChanged: (text){
                    setState(() {
                      groupName=text;
                    });
                  },
                  decoration: ConstWigdet().inputDecoration('Your group name')
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  validator: (val) {
                    if(val==null||val.isEmpty){
                      return 'Enter hour';
                    }
                    else
                    {return null;}
                    },
                  controller: hourEditingController,
                  onChanged: (text){
                    setState(() {
                      hour=text;});
                    },
                  decoration: ConstWigdet().inputDecoration('Begin at hour ?')
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      validator: (val) {
                        if(val==null||val.isEmpty){
                          return 'Enter minutes';
                        }
                        else
                        {return null;}
                      },
                      controller: minutesEditingController,
                      onChanged: (text){
                        setState(() {
                          minutes=text;
                        });
                      },
                      decoration: ConstWigdet().inputDecoration('Begin at minutes ?')
                    ),
                  ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  validator: (val) {
                    if(val==null||val.isEmpty){
                      return 'Enter date';
                    }
                    else
                    {return null;}
                  },
                  controller: dateEditingController,
                  onTap: () async{
                    // Below line stops keyboard from appearing
                    FocusScope.of(context).requestFocus(FocusNode());
                    // Show Date Picker Here
                    await _selectDate(context);
                    dateEditingController.text = DateFormat('dd/MM/yyyy').format(date!);
                  },
                  decoration: ConstWigdet().inputDecoration("Enter date"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  validator: (val) {
                    if(val==null||val.isEmpty){
                      return 'Enter name';
                    }
                    else
                    {return null;}
                  },
                  controller: ownerEditingController,
                  onChanged: (text){
                    setState(() {
                      owner=text;
                    });
                  },
                  decoration: ConstWigdet().inputDecoration("Your name")
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: heightR/14,
                  decoration:BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.circular(40)
                  ),
                  child: Row(
                    children: [
                      const Text('  Subjects: '),
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
                          value: subject??optionsSubjects[0],
                          onChanged:(newGender){
                            setState(() {
                              subject = newGender;
                            });
                          } ,
                          items: optionsSubjects.map((gender){
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
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  maxLines: 2,
                  controller: descriptionEditingController,
                  onChanged: (text){
                    setState(() {
                      description=text;
                    });
                  },
                  decoration: ConstWigdet().inputDecoration('Write a few lines of group description to make\n it easier for users to reach the group.')
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal:60),
                  child: Container(
                    height: 50,
                    width:widthR,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple[300],
                        borderRadius: const BorderRadius.all(Radius.circular(40))
                    ),
                    child:TextButton(
                      child: Text('Save',style:Font().bodyWhite ),
                      onPressed:()async{
                        print(date);
                        if(formKey.currentState!.validate()) {
                          asset=_selectedImage==null?null:_selectedImage!.path;
                          await DatabaseService(uid: '${studyList!.length}').updateDatabase(hour, minutes, groupName, owner, subject, 'true',description,'No',date,asset,user!.uid);
                          Navigator.push(context,MaterialPageRoute(builder: (context) => const HomePage()),);
                        }
                        },
                    ),
                  )
              ),
              Padding(
                padding:const EdgeInsets.symmetric(vertical: 20,horizontal:60),
                child:Container(
                  height: 50,
                  width:widthR,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[300],
                      borderRadius: const BorderRadius.all(Radius.circular(40))
                  ),
                  child: InkWell(
                    onTap:(){
                      Get.to(()=>const UpdateGroup());
                    },
                    child:ListTile(
                      leading: const Icon(Icons.group,color: Colors.white ,),
                      title: Text('Update your group',style:Font().bodyWhite,),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
  Widget imageCreate(double widthR,double heightR){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: SizedBox(
        width: widthR/1.5,
        height: heightR/2.5,
        child: Stack(
          children: [
            ClipRRect(
              // rounded corner image
                borderRadius: ConstValue().borderRadius,
                child: ShaderMask(
                  // gradient layer
                    shaderCallback: (bound) {
                      return  LinearGradient(
                          end: FractionalOffset.topCenter,
                          begin: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.5),
                            Colors.transparent,
                          ],
                          stops:const [0.0, 0.3, 0.7])
                          .createShader(bound);
                    },

                    blendMode: BlendMode.srcOver,
                    child:_selectedImage==null? Image.asset('assets/images/swipe_image.png',fit:BoxFit.fill,) : Image.file(File(_selectedImage!.path),fit: BoxFit.fill,)
                )),
            Positioned(
              top:10,
              right:15,
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
                child: const Icon(
                  Icons.camera_alt,
                  size: 40,
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date ?? now,
        firstDate: now,
        lastDate: DateTime(2101));
    if (picked != null && picked != date) {
      print('$picked');
      setState(() {
        date = picked;
      });
    }
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

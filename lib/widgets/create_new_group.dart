import 'package:app/pages/home_page.dart';
import 'package:app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:app/models/time_study.dart';

class CreateNewGroup extends StatefulWidget {
  const CreateNewGroup({super.key});

  @override
  State<CreateNewGroup> createState() => _CreateNewGroupState();
}

class _CreateNewGroupState extends State<CreateNewGroup> {
  String? groupName,hour,minutes,owner,subject,description;
  int tag=1;
  final body=GoogleFonts.roboto(fontSize: 19,color: Colors.white);
  final headingBlack=GoogleFonts.roboto(fontSize: 21,fontWeight: FontWeight.bold,color: Colors.black);
  final groupNameEditingController=TextEditingController();
  final hourEditingController=TextEditingController();
  final minutesEditingController=TextEditingController();
  final ownerEditingController=TextEditingController();
  final descriptionEditingController=TextEditingController();
  final formKey=GlobalKey<FormState>();
  List<String>optionsSubjects=['Choose a subject','Calculus','Linear Algebra','Probability','Microeconomics','Macroeconomics','Development economics','Data Structures and Algorithms','Object Oriented Programming','Technical Programming'];
  @override
  Widget build(BuildContext context) {
    double widthR=MediaQuery.of(context).size.width;
    double heightR=MediaQuery.of(context).size.height;
    final studyList=Provider.of<List<TimeStudy>?>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
          key: formKey,
          child: ListView(
            children: [
              Center(
                child: Padding(
                  padding:const EdgeInsets.symmetric(vertical: 15),
                  child:Text('Create and Custom your group',style: headingBlack),
                ),
              ),
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
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(40)),
                          borderSide: BorderSide(color: Colors.black,width:2.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(40)),
                          borderSide: BorderSide(color: Colors.deepPurple,width:2.0)
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      labelText:'Your group name'
                  ),
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
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(40)),
                          borderSide: BorderSide(color: Colors.black,width:2.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(40)),
                          borderSide: BorderSide(color: Colors.deepPurple,width:2.0)
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      labelText:'Start in hour ?'
                  ),
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
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(40)),
                              borderSide: BorderSide(color: Colors.black,width:2.0)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(40)),
                              borderSide: BorderSide(color: Colors.deepPurple,width:2.0)
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          labelText:'Start in minutes ?'
                      ),
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
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(40)),
                          borderSide: BorderSide(color: Colors.black,width:2.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(40)),
                          borderSide: BorderSide(color: Colors.deepPurple,width:2.0)
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      labelText:'Your name'
                  ),
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
                  maxLines: 3,
                  controller: descriptionEditingController,
                  onChanged: (text){
                    setState(() {
                      description=text;
                    });
                  },
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(70)),
                          borderSide: BorderSide(color: Colors.black,width:2.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(70)),
                          borderSide: BorderSide(color: Colors.deepPurple,width:2.0)
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      labelText:'Write a few lines of group description to make\n it easier for users to reach the group.'
                  ),
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
                      child: Text('Save',style:body),
                      onPressed:()async{
                        if(formKey.currentState!.validate()) {
                          await DatabaseService(uid: '${studyList!.length}').updateDatabase(hour, minutes, groupName, owner, subject, 'true',description,'No');
                          Navigator.push(context,MaterialPageRoute(builder: (context) => const HomePage()),);
                        }
                        },
                    ),
                  )
              )
            ],
          ),
        ),
    );
  }
}

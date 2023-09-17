import 'package:app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:app/models/time_study.dart';
import 'package:app/const_value.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:app/services/database.dart';

class UpdateGroup extends StatefulWidget {
  const UpdateGroup({super.key});

  @override
  State<UpdateGroup> createState() => _UpdateGroupState();
}

class _UpdateGroupState extends State<UpdateGroup> {
  List <TimeStudy> timeStudy=<TimeStudy>[];
  List <int> stt=<int>[];
  DateFormat dateFormat=DateFormat('dd-MM-yyyy');
  final formKey=GlobalKey<FormState>();
  DateTime? date;
  String? hour,minutes;
  final hourEditingController=TextEditingController();
  final minutesEditingController=TextEditingController();
  final dateEditingController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    double heightR=MediaQuery.of(context).size.height;
    double widthR=MediaQuery.of(context).size.width;
    final studyList=Provider.of<List<TimeStudy>?>(context);
    final user=Provider.of<MyUser?>(context);
    if(studyList!=null){
      timeStudy=[];
      stt=[];
      for(int i=0;i<studyList.length;i++){
        if(studyList[i].uid==user!.uid){
          timeStudy.add(studyList[i]);
          stt.add(i);
        }
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
      body:SizedBox(
        height: heightR,
        width: widthR,
        child: ListView.builder(
          itemCount: timeStudy.length,
          itemBuilder:(context,index){
            return ListTile(
              leading:const Icon(Icons.group),
              title:Text(timeStudy[index].name!,style: Font().headingBlack,),
              subtitle: Text('Begin at ${timeStudy[index].hour}:${timeStudy[index].minutes} in ${dateFormat.format(timeStudy[index].dateTime!)}'),
              onTap:(){
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context){
                      return Form(
                        key: formKey,
                        child: SizedBox(
                          height: heightR/2,
                          width: widthR,
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                                          await DatabaseService(uid: '${stt[index]}').updateDatabase(hour, minutes, studyList?[stt[index]].name,studyList?[stt[index]].owner,studyList?[stt[index]].subjects, 'true',studyList?[stt[index]].description,'No',date,studyList?[stt[index]].asset,user!.uid);
                                          Navigator.pop(context);
                                        }
                                      },
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                );
              },
            );
          },
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
}

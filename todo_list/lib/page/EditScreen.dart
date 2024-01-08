// ignore_for_file: no_logic_in_create_state, must_be_immutable, non_constant_identifier_names, file_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../model/user.dart';
// import 'Input.dart';



class TaskEdit extends StatefulWidget { 
  final User user;
  

  TextEditingController nameControl=  TextEditingController();
  TextEditingController emailControl=  TextEditingController();
  TextEditingController NumberPhoneControl=  TextEditingController();
  TextEditingController CountryContrl=  TextEditingController();

  TaskEdit({super.key,
    required this.user,
  });

  @override
  State<TaskEdit> createState() => _TaskEditState(
    user, nameControl, emailControl, NumberPhoneControl, CountryContrl
    
  );
}

class _TaskEditState extends State<TaskEdit> {

  final User user;

  //  PUT DATA
  Future<void> putData(String ID) async{
    final url = 'http://10.0.2.2:3100/v1/api/user/$ID';
    final uri = Uri.parse(url);
    final body = {
      "name": nameControl.text, 
      "email": emailControl.text, 
      "NumberPhone": NumberPhoneControl.text, 
      // "Address": {
      //   "Address1": _Address1Controller.text,
      //   "Address2": _Address2Controller.text,
      //   "Address3": _Address3Controller.text,
      // }  ,
      "Country": CountryContrl.text, 
    };
    final json = jsonEncode(body);
    final response = await http.put(
      uri, 
      body: json,
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if(response.statusCode >= 200 && response.statusCode<300){
      // ShowMessage('Delete Success');
    }else{
      // ShowMessage('Uncompeleted');
    }
    print(response.statusCode);
  }

  _TaskEditState(
    this.user,
    this.nameControl,
    this.NumberPhoneControl,
    this.CountryContrl, this.emailControl,
  );

  TextEditingController nameControl=  TextEditingController();
  TextEditingController emailControl=  TextEditingController();
  TextEditingController NumberPhoneControl=  TextEditingController();
  TextEditingController CountryContrl=  TextEditingController();

  


  @override
  void initState() {
    super.initState();

    nameControl.text = user.name;
    emailControl.text = user.email;
    NumberPhoneControl.text = user.NumberPhone;
    CountryContrl.text = user.Country;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber[700],
      appBar: AppBar(
        title: const Text('TaskEdit',
           style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      style: TextStyle(fontSize: 26),
                      decoration: InputDecoration(
                        labelText: 'Avatar'
                      ),
                    )
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      radius: 50,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10,),
              TextField(
                style: const TextStyle(fontSize: 26),
                controller: nameControl,
                decoration:const  InputDecoration(
                  labelText: 'Name'
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                style: const TextStyle(fontSize: 26),
                controller: emailControl,
                decoration:const  InputDecoration(
                  labelText: 'Email'
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                style: const TextStyle(fontSize: 26),
                controller: NumberPhoneControl,
                decoration:const  InputDecoration(
                  labelText: 'NumberPhone'
                ),
                onChanged: (value){
                  widget.user.NumberPhone = value;
                },
              ),
              TextField(
                style: const TextStyle(fontSize: 26),
                controller: CountryContrl,
                decoration:const  InputDecoration(
                  labelText: 'Country'
                ),
              ),
              const SizedBox(height: 50,),
              ElevatedButton(
                onPressed: (){
                  putData(user.ID);
                },
                child:const Text('Save', style:TextStyle(fontSize: 30) ,),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
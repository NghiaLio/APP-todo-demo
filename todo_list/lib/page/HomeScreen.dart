
// ignore_for_file: unused_field, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_list/config/Task.dart';
import 'package:http/http.dart' as http;

import '../model/user.dart';
import '../config/dialog-create.dart';
import '../config/dialog-delete.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState();

  List<User> user = [];

  @override
  void initState() {
    
    super.initState();
    callAPI();
  }

//  ShowMessage

  void ShowMessage(String message){
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
   

//  GET DATA

  Future<void> callAPI()async {
    const url = 'http://10.0.2.2:3100/v1/api/user';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json as List;
    setState(() {
      
      user = result.map((e) {
        final address = Address(
          address1: e['Address']['Address1'],
          address2: e['Address']['Address2'],
          address3: e['Address']['Address3'],
        );
        return User(
          ID: e['_id'],
          name: e['name'],
          NumberPhone: e['NumberPhone'],
          email: e['email'],
          Country: e['Country'],
          address: address
        ) ;
      }
      ).toList();
    });
  }


// POST DATA

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _NumberPhoneController = TextEditingController();
  final _Address1Controller = TextEditingController();
  final _Address2Controller = TextEditingController();
  final _Address3Controller = TextEditingController();
  final _CountryController = TextEditingController();

  
  Future<void> postData() async{
    const url = 'http://10.0.2.2:3100/v1/api/user';
    final uri = Uri.parse(url);
    final body = {
      "name": _nameController.text, 
      "email": _emailController.text, 
      "NumberPhone": _NumberPhoneController.text, 
      "Address": {
        "Address1": _Address1Controller.text,
        "Address2": _Address2Controller.text,
        "Address3": _Address3Controller.text,
      }  ,
      "Country": _CountryController.text, 
    };
    final json = jsonEncode(body);
    final response = await http.post(
      uri, 
      body: json,
      headers: {
        'Content-Type': 'application/json'
      }
    );
    if(response.statusCode == 201){
       print('Success');
       ShowMessage('Create data Success');
    }else{
      print('Fail');
       ShowMessage('Create data fail');
    }
   
  }

// DELETE DATA

  Future<void> deleteData(String id)async{ 
    final url = 'http://10.0.2.2:3100/v1/api/user/$id';
    final uri = Uri.parse(url);

    final response = await http.delete(uri);
    if(response.statusCode >= 200 && response.statusCode<300){
      ShowMessage('Delete Success');
    }else{
      ShowMessage('Uncompeleted');
    }
    print(response.statusCode);
  }









  // // Clear text in TextField
  void clearText(){
    _nameController.clear();
    _emailController.clear();
    _NumberPhoneController.clear();
    _Address1Controller.clear();
    _Address2Controller.clear();
    _Address3Controller.clear();
    _CountryController.clear();
  }
  // DIALOG Create DATA
  void createNewTask(){
    // clearText();
    showDialog(
      context: context, 
      builder: (context){
        return DiaglogBox(
          nameController: _nameController,
          emailController: _emailController,
          NumberPhoneController: _NumberPhoneController,
          Address1Controller: _Address1Controller,
          Address2Controller: _Address2Controller,
          Address3Controller: _Address3Controller,
          CountryController: _CountryController,
          onSave: (){
            postData();
            Navigator.pop(context);
            callAPI();
            // snackbar('Create Success!');
          },
        );
      });
    
    
  }
  //DIALOG DELETE DATA
  void deleteTask(int index, String ID ){
    showDialog(
      context: context, 
      builder: (context){
        // print(ID);
        return DialogDelete(
          onYes: () {
            deleteData(ID);
            Navigator.pop(context);


            //  Cach 1: Tim cac phan tu co id khac vs id xoa roi gop lai thanh 1 list va set lai vao list ban dau
            final filter = user.where((element) => element.ID != ID).toList();
            setState(() {
              user = filter;
            });


            //  Cach 2: Goi lai ham callAPI de lay lai du lieu
            // callAPI();
          },
          onNo: () => Navigator.pop(context),
        );
      });
  }



 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[700],
      appBar: AppBar(
        title:const Text('List Information',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: callAPI,
        child: ListView.builder(
          itemCount: user.length,
          itemBuilder: (context, index) {
            return ListInfor(
                            user: user[index],
                            DeleteFunction:()=>deleteTask(
                                                index,
                                                user[index].ID
                            ),
                            index: index,
                          );
          }
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: FloatingActionButton(
          onPressed: createNewTask,
          child:const Icon(Icons.add),
        ),
      )
    );
  }
}
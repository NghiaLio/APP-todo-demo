// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

import 'Input.dart';


// ignore: must_be_immutable
class DiaglogBox extends StatefulWidget {
  final nameController;
  final emailController;
  final NumberPhoneController;
  final Address1Controller;
  final Address2Controller;
  final Address3Controller;
  final CountryController;
  VoidCallback onSave;
   DiaglogBox(
    {super.key,required this.nameController, 
          required this.emailController, 
          required this.NumberPhoneController,
          required this.Address1Controller,
          required this.Address2Controller,
          required this.Address3Controller,
          required this.CountryController,
          required this.onSave
    }
  );

  @override
  // ignore: no_logic_in_create_state
  State<DiaglogBox> createState() => _DiaglogBoxState(
    nameController,
    emailController,
    NumberPhoneController,
    Address1Controller,
    Address2Controller,
    Address3Controller,
    CountryController,
    onSave
  );
}

class _DiaglogBoxState extends State<DiaglogBox> {
  final nameController;
  final emailController;
  final NumberPhoneController;
  final Address1Controller;
  final Address2Controller;
  final Address3Controller;
  final CountryController;
  VoidCallback onSave;

  _DiaglogBoxState(
    this.nameController, 
    this.emailController, 
    this.NumberPhoneController,
    this.Address1Controller,
    this.Address2Controller,
    this.Address3Controller,
    this.CountryController,
    this.onSave
  );

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: AlertDialog(
        backgroundColor: Colors.white,
        content: SizedBox(
          height: 750,
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextInput(hintText: 'Name', controler:nameController),
                TextInput(hintText: 'email',controler: emailController, ),
                TextInput(hintText: 'NumberPhone',controler: NumberPhoneController,),
                TextInput(hintText: 'Address1',controler: Address1Controller, ),
                TextInput(hintText: 'Address2',controler: Address2Controller, ),
                TextInput(hintText: 'Address3',controler: Address3Controller, ),
                TextInput(hintText: 'Country',controler: CountryController, ),
    
                
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: onSave, 
                        // ignore: sort_child_properties_last
                        child: const Text('Save', style: TextStyle(fontSize: 20),),
                      ),
                      const SizedBox(width: 20,),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.pop(context);
                        }, 
                        child:const Text('Cancle',  style: TextStyle(fontSize: 20),),
                      ),
                        
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


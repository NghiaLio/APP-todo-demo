
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../page/ProfileScreen.dart';
import '../page/EditScreen.dart';
// import 'package:test5/page/TaskEdit.dart';


import '../model/user.dart';

// ignore: must_be_immutable
class ListInfor extends StatelessWidget {
  final User user;
  final index;
  void Function()? DeleteFunction;
  
  ListInfor({super.key, 
              required this.user, 
              required this.DeleteFunction, 
              required this.index,
              // required EditFunction
            }
          );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.all(15),
          // ignore: sort_child_properties_last
          child: Row(
            children: [
              const CircleAvatar(),
              const SizedBox(width: 15,),
              Expanded(
                child: Text(user.name,
                  style: const TextStyle(fontSize: 26),
                )
              ),
              IconButton(
                onPressed:(){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (c)=>TaskEdit(user: user,))
                  );
                },
                icon:const Icon(Icons.edit, size: 30,)
              ),
              IconButton(
                onPressed:DeleteFunction,  
                icon:const Icon(Icons.delete, size: 30,)
              )
            ],
          ),
          decoration:const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))
            ),
        ),
        onTap: (){
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (c)=>TaskProfile(user: user,index: index,))
          );
        },
      ),
    );
  }
}
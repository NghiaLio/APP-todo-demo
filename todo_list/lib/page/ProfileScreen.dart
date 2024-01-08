import 'package:flutter/material.dart';

import '../model/user.dart';

class TaskProfile extends StatelessWidget {
  final User user;
  final index;
  const TaskProfile({super.key, required this.user,required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[700],
      appBar: AppBar(
        title:const  Text('ProfileTask',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          alignment: Alignment.center,
          child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: CircleAvatar(
                    radius: 100,
                  ),
                ),
                const SizedBox(height: 20,),
                Text(user.name,
                  style:const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10,),
                Text(user.NumberPhone,
                  style:const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 10,),
                Text(user.email,
                  style:const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20,),
                const Divider(height: 1,color: Colors.black54,),
                const SizedBox(height: 30,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Address:', 
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                    ),
                    // const SizedBox(width: 20,),
                    Column(
                      children: [
                        Text(user.address.address1, style:const TextStyle(fontSize: 24),),
                        Text(user.address.address2, style:const TextStyle(fontSize: 24),),
                        Text(user.address.address3, style:const TextStyle(fontSize: 24),),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Country:', 
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      children: [
                        Text(user.Country, style:const TextStyle(fontSize: 24),),
                      ],
                    )
                  ],
                ),
              ],
            ),
        ),
      ),
    );
  }
}
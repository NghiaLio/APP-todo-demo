import 'package:flutter/material.dart';



// ignore: must_be_immutable
class DialogDelete extends StatelessWidget {
  VoidCallback onYes;
  VoidCallback onNo;
  DialogDelete({super.key, required this.onNo, required this.onYes});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Text('Do you want to delete this task!',
              style: TextStyle(fontSize: 26),
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  // ignore: sort_child_properties_last
                  child: const Text('Yes',
                      style: TextStyle(fontSize: 26, color: Colors.red),
                    ),
                  onPressed:onYes,
                ),
                const SizedBox(width: 50,),
                TextButton(
                  // ignore: sort_child_properties_last
                  child:const Text('No',
                      style: TextStyle(fontSize: 26),
                    ),
                  onPressed:onNo,
                )
              ],
            )
          ]
          ),
        ),
      ),
    ) ;
  }
}
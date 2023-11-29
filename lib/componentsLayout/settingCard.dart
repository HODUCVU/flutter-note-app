import 'package:flutter/material.dart';

class SettingCard {
  static Widget CardView(List<String> tags, String title,Brightness currentBrightness, bool tagb) {
    return Card(
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Đặt độ cong là 0.0 để có góc vuông
            ),
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        color: (currentBrightness == Brightness.light) ? Colors.yellowAccent[100]: Colors.grey[500],
        child: Column(
          children: [
            Center(child: Text(title,
            style: const TextStyle(
              fontFamily: 'VinaSans',
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            )),
            ),
            const SizedBox(height: 10,),
            Container(
              color: (currentBrightness == Brightness.light) ? Colors.white: Colors.grey[500],
              child: Column(
                children: [
                  InkWell(
                    onTap: ()
                    {
                      // Show Text input and add tag
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0), // Đặt góc vuông ở đây
                        ),
                       child: Row(
                        children: tagb
                        ? [
                            Icon(Icons.add),
                            SizedBox(width: 20),
                            Text('Add Tag'),
                          ]
                        : [
                            Icon(Icons.add),
                            SizedBox(width: 20),
                            Text('About Us'),
                          ],) 
                    ),
                  ),   
                if(tagb) 
                  Wrap(
                  spacing: 0.0,
                  runSpacing: 0.0,
                  children: tags.map((tag) {
                  return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0), // Đặt góc vuông ở đây
                            ),

                          child: Row(children: [
                            const Icon(Icons.tag),
                            const SizedBox(width: 20,),
                            Text(tag),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.more_vert),
                                  onPressed: (){
                                    // show dialog delete, edit
                                    print('${tag}');
                                  },
                                ),
                              ),
                            )
                          ]),
                        );
                    }).toList(),
                  ),
                ],),
              ),
          ],),
      );
  }
}
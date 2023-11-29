import 'package:flutter/material.dart';
import 'package:note_list_app/Models/Notes.dart';
import 'package:note_list_app/componentsLayout/handle.dart';
import 'package:note_list_app/componentsLayout/menu.dart';
import 'package:note_list_app/datacontext/dataStruct.dart';

class ViewNote extends StatefulWidget {
  const ViewNote({super.key});

  @override
  State<ViewNote> createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  late Brightness _currentBrightness;
  final bool _isDarkModeEnabled = false;
  late List<String> images;
  late Notes notes;
  @override
  void initState() {
    super.initState();
    _currentBrightness = CurrentBrightness;

    images = ['avarta.jpeg'];

    // from data
    notes = Notes('Meeting', 'Work',' Họp nhóm môn lập trình Đa nền tảng.\n Công việc:\n 1. Phân công nhiệm vụ.\n 2. Triển khai thực hiện dự án.\n 3. Làm báo cáo.'
     , const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal, color: Colors.black),
      const TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, fontStyle: FontStyle.normal, color: Colors.black));
  }

  @override
  Widget build(BuildContext context) {
     //theme
    return Theme(data: _currentBrightness == Brightness.light ? Handle.lightTheme : Handle.darkTheme,
      child: Scaffold(
        backgroundColor: (_currentBrightness == Brightness.light) ? Colors.blue[100]: Colors.grey[500],
        appBar: AppBar(
          title: const Text(
            "Note Detail",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green[900],
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                        // -> move on create note with Title, tag and notes data
                    },
                  ),
                  const SizedBox(width: 5,),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                        // -> move on view note layout without save data
                    },
                  ),
                  const SizedBox(width: 5,),
                  IconButton(
                    icon: Transform.rotate(
                      angle: 45 * (3.141592653589793 / 180), // Convert degrees to radians
                      child: const Icon(Icons.push_pin, color: Colors.black,),
                    ),
                    onPressed: () {
                      //  make pin ~= pin
                      // color: if(pin) ? Colors.blue: Colors.black;
                    },
                  ),
                  const SizedBox(width: 5,),
                  Menu.buildPopupMenuButton(context),
                ],
              ),    
            ),
          ],
          leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Quay lại màn hình trước đó khi nhấn nút
            Navigator.pop(context);
          },
        ),
     ), 
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    elevation: 10,
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    color: (_currentBrightness == Brightness.light) ? Colors.yellowAccent[100]: Colors.blueGrey[500],
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                        child: Text(
                          notes.title,
                          style: notes.titleStyle,
                        ),),
                    ),),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Card(
                      elevation: 10,
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      color: (_currentBrightness == Brightness.light) ? Colors.red[100]: Colors.green[500],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0), // Đặt độ cong là 0.0 để có góc vuông
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.tag),
                          Text(
                              notes.tag,
                              style: const TextStyle(
                                fontSize: 10.0,
                              ),
                            )
                        ],
                      ),),
                  ),
                  const Divider(height: 30,
                    color: Colors.grey,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      color: (_currentBrightness == Brightness.light) ? Colors.yellowAccent[100]: Colors.blueGrey[500],
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                            child: Text(
                              'Notes:\n ${notes.notes}',
                              style: notes.notesStyle,
                            ),),
                        ],
                      ),),
                  ),
                ],
              )
          ),
        ),
      ));
  }
}
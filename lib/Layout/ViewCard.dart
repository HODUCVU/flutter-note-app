import 'package:flutter/material.dart';
import 'package:note_list_app/Layout/Account.dart';
import 'package:note_list_app/Layout/CreateNote.dart';
import 'package:note_list_app/Layout/Setting.dart';
import 'package:note_list_app/Layout/ViewNote.dart';
import 'package:note_list_app/Models/AccountUser.dart';
import 'package:note_list_app/componentsLayout/handle.dart';
import 'package:note_list_app/componentsLayout/menu.dart';
import 'package:note_list_app/componentsLayout/search.dart';
import 'package:note_list_app/componentsLayout/viewCardMode.dart';
import 'package:note_list_app/datacontext/dataStruct.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewCard extends StatefulWidget {
  const ViewCard({Key? key}) : super(key: key);

  @override
  State<ViewCard> createState() => _ViewCard();
}

class _ViewCard extends State<ViewCard> {
  late List<Map<String, String>> items;
  late List<String> search;
  // late List<String> images;
  late AccountUser account;

  var _currentBrightness;
  final bool _isDarkModeEnabled = IsDarkModeEnabled;
  void updateBrightnessAndMode(Brightness brightness) {
    setState(() {
      _currentBrightness = brightness;
    });
  }
  late bool isGridView;
  @override
  void initState() {
    super.initState();
    // _currentBrightness = Brightness.light;
    _currentBrightness = CurrentBrightness;
    
    items = [
      {"title": "Meeting", "date": "2023-11-27", "pin": "false"},
      {"title": "Appointment", "date": "2023-11-28", "pin": "false"},
      {"title": "Event", "date": "2023-11-29", "pin": "true"},
      {"title": "Deadline", "date": "2023-11-30", "pin": "false"},
      {"title": "Project Kick-off", "date": "2023-12-01", "pin": "true"},
    ];
    search = items
        .map((item) => item['title'] ?? '')
        .toList();

    // images = ['avarta.jpeg'];
    account = AccountUser('avarta.jpeg', 'Anna Mei', 'abc@gmail.com', true);
    isGridView = true;
  }
  
  @override
  Widget build(BuildContext context) {
    
    items.sort((a, b) => a["pin"]!.compareTo(b["pin"]!));
    var notesPinned = items.where((item) => item["pin"] == 'true').toList();
    var notes = items.where((item) => item["pin"] == 'false').toList();
    return Theme(
      data: _currentBrightness == Brightness.light ? Handle.lightTheme : Handle.darkTheme,
      child: Scaffold(
        backgroundColor: (_currentBrightness == Brightness.light) ? Colors.blue[100]: Colors.grey[500],
        appBar: AppBar(
          title: const Text(
            "View Card",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green[900],
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                        // show dialog
                      Search.showSearchDialog(context, search);
                    }, 
                    icon: const Icon(Icons.search)
                  ),
                  IconButton(onPressed: () {
                      setState(() {
                        isGridView = !isGridView;
                      });
                    }, 
                    icon: Icon(isGridView ? Icons.view_list : Icons.grid_on),
                  ),
                  Menu.buildPopupMenuButton(context),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              // move on create Note layout
              Navigator.pushNamed(context, '/createNote');
            });
          },
          icon: const Icon(Icons.add),
          label: const Text('Create note'),
          backgroundColor: Colors.grey,
        ),
        drawer: Menu.menu(context, _currentBrightness, account, updateBrightnessAndMode),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  color: (_currentBrightness == Brightness.light) ? Colors.yellowAccent[100]: Colors.grey[500],
                  child: Column(
                    children: <Widget>[
                      const Text(
                             'PINNED NOTE',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                              ),
                            ),
                    ViewCardMode.buildCardMode(context, isGridView, _currentBrightness, notesPinned),
                  ]),),
                  Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  color: (_currentBrightness == Brightness.light) ? Colors.yellowAccent[100]: Colors.grey[500],
                  child: Column(
                    children: <Widget>[
                    const SizedBox(height: 20,),
                    const Text(
                             'NOTE',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                              ),
                            ),
                      ViewCardMode.buildCardMode(context, isGridView, _currentBrightness, notes),
                      const SizedBox(height: 20,),
                    ],
                  ),
                ),
            ],),
          ),
        ),
      ),
    );
  }
}

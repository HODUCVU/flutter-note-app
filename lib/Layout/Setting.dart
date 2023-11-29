import 'package:flutter/material.dart';
import 'package:note_list_app/Models/AccountUser.dart';
import 'package:note_list_app/componentsLayout/handle.dart';
import 'package:note_list_app/componentsLayout/menu.dart';
import 'package:note_list_app/componentsLayout/settingCard.dart';
import 'package:note_list_app/datacontext/dataStruct.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  late Brightness _currentBrightness;
  final bool _isDarkModeEnabled = false;
  void updateBrightnessAndMode(Brightness brightness) {
    setState(() {
      _currentBrightness = brightness;
    });
  }
  late AccountUser account;

  late List<String> tags;

  @override
  void initState() {
    super.initState();
    _currentBrightness = CurrentBrightness;
    //from data
    account = AccountUser('avarta.jpeg', "Anna Mie", 'abc@gmail.com', true);
    tags = ['Spend', 'Work', 'School', 'Exercise', 'Bank'];
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _currentBrightness == Brightness.light ? Handle.lightTheme : Handle.darkTheme,
      child: Scaffold(
        backgroundColor: (_currentBrightness == Brightness.light) ? Colors.blue[100]: Colors.grey[500],
        appBar: AppBar(
          title: const Text(
            "Setting",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green[900],
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  Menu.buildPopupMenuButton(context),
                ],
              ),
            )
          ],
        ),
        drawer: Menu.menu(context, _currentBrightness, account, updateBrightnessAndMode),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SettingCard.CardView(tags, 'Tags', _currentBrightness, true),
                const SizedBox(height: 30,),
                SettingCard.CardView(tags, 'About', _currentBrightness, false),
            ],),
          ),
        ),
      ),
    );
  }
}
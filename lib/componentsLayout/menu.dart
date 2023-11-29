
import 'package:flutter/material.dart';
import 'package:note_list_app/Models/AccountUser.dart';
import 'package:note_list_app/Models/Notes.dart';
import 'package:note_list_app/componentsLayout/handle.dart';
// import 'package:note_list_app/componentsLayout/viewmode.dart';
import 'package:note_list_app/datacontext/dataStruct.dart';

class Menu {
  static Drawer menu(BuildContext context, Brightness currentBrightness, AccountUser account, Function(Brightness) updateCallback) {
    return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 200,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: (currentBrightness == Brightness.light) ? Colors.white: Colors.grey[900],
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/${account.image}'),
                        radius:  40.0,
                      ),
                      const Divider(height: 10,
                      color: Colors.black,),
                      Text("Anna Mie",
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 15.0,
                        color: (currentBrightness == Brightness.light) ? Colors.black: Colors.white),
                      ),
                      Text("abc@gmail.com",
                      style: TextStyle(
                        // fontFamily: 'Pacifico',
                        fontSize: 15.0,
                        color: (currentBrightness == Brightness.light) ? Colors.black: Colors.white
                      ),),
                      Text("Status: online",
                      style: TextStyle(
                        // fontFamily: 'Pacifico',
                        fontSize: 15.0,
                        color: (currentBrightness == Brightness.light) ? Colors.black: Colors.white
                      ),),
                    ],
                  ), 
                ),
              ),
              ListTile(
                title: const Row(children: [
                  Icon(Icons.card_membership),
                   SizedBox(width: 30,),
                  Text('Card')
                ]),
                onTap: () {
                  // Handle item 1 tap
                  Navigator.pushNamed(context, '/viewCard');
                },
              ),
              Container(height: 1,
              color: Colors.black,),
              ListTile(
                title: const Row(children: [
                  Icon(Icons.account_circle),
                   SizedBox(width: 30,),
                  Text('Account')
                ]),
                onTap: () {
                  // Handle item 1 tap
                  Navigator.pushNamed(context, '/Account');
                },
              ),
              ListTile(
                title: Row(children: [
                  const Icon(Icons.dark_mode),
                  const SizedBox(width: 30,),
                  Text('Dark Mode: ${currentBrightness == Brightness.dark ? 'On' : 'Off'}'),
                  const SizedBox(width: 30,),
                  Switch(
                    value: IsDarkModeEnabled,
                    onChanged: (value) {
                      updateCallback(
                        CurrentBrightness = (currentBrightness == Brightness.light) ? Brightness.dark : Brightness.light
                      );
                    },
                  ),
                ]),
                onTap: () {
                 
                  Navigator.pop(context); // Close the drawer
                },
              ),
              Container(height: 1,
              color: Colors.black,),
              ListTile(
                title: const Row(children: [
                  Icon(Icons.settings),
                  SizedBox(width: 30,),
                  Text('Settting')
                ]),
                onTap: () {
                  // Handle item 3 tap
                  Navigator.pushNamed(context, '/Setting');
                },
              ),
            ],
          ),
        );
  }
  static PopupMenuButton<String> buildPopupMenuButton(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: Handle.handleMenuItemClick,
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem<String>(
            value: "Logout",
            child: Text("Logout"),
          ),
          const PopupMenuItem<String>(
            value: "More info",
            child: Text("More info"),
          ),
          const PopupMenuItem<String>(
            value: "Help",
            child: Text("Help"),
          ),
        ];
      },
    );
  }
}
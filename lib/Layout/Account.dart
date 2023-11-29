import 'package:flutter/material.dart';
import 'package:note_list_app/Models/AccountUser.dart';
import 'package:note_list_app/componentsLayout/handle.dart';
import 'package:note_list_app/componentsLayout/menu.dart';
import 'package:note_list_app/datacontext/dataStruct.dart';

class Account extends StatefulWidget {
  const Account({super.key});
  @override
  State<Account> createState() => _Account();
}
class _Account extends State<Account> {

  var _currentBrightness;
  final bool _isDarkModeEnabled = IsDarkModeEnabled;
  void updateBrightnessAndMode(Brightness brightness) {
    setState(() {
      _currentBrightness = brightness;
    });
  }
  late AccountUser account;
  @override
  void initState() {
    super.initState();
    _currentBrightness = CurrentBrightness;
    account = AccountUser('avarta.jpeg', "Anna Mie", 'abc@gmail.com', true);
  }
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _currentBrightness == Brightness.light ? Handle.lightTheme : Handle.darkTheme,
      child: Scaffold(
        backgroundColor: (_currentBrightness == Brightness.light) ? Colors.blue[100]: Colors.grey[500],
        appBar: AppBar(
          title: const Text(
            "Account",
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
              Card(
                shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Đặt độ cong là 0.0 để có góc vuông
                      ),
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                color: (_currentBrightness == Brightness.light) ? Colors.yellowAccent[100]: Colors.grey[500],
                child: Column(children: [
                    const Center(
                      child: Text('Account',
                      style: TextStyle(
                        fontFamily: 'VinaSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),)
                      ,
                    ),
                     Container(
                      margin: const EdgeInsets.fromLTRB(40, 10, 0, 20),
                      alignment: Alignment.center,
                       child: Row(
                         children: [
                           CircleAvatar(
                              backgroundImage: AssetImage('assets/${account.image}'),
                              radius:  40.0,
                            ),
                            const SizedBox(width: 20,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(account.name,
                                style: TextStyle(
                                  fontFamily: 'Pacifico',
                                  fontSize: 15.0,
                                  color: (_currentBrightness == Brightness.light) ? Colors.black: Colors.white),
                                ),
                                Text(account.mail,
                                style: TextStyle(
                                  // fontFamily: 'Pacifico',
                                  fontSize: 15.0,
                                  color: (_currentBrightness == Brightness.light) ? Colors.black: Colors.white
                                ),),
                                Text('Status: ${(account.status) ? 'online':'offline'}' ,
                                style: TextStyle(
                                  // fontFamily: 'Pacifico',
                                  fontSize: 15.0,
                                  color: (_currentBrightness == Brightness.light) ? Colors.black: Colors.white
                                ),),
                              ],
                            ),
                         ],
                       ),
                     ),
                ],)
              ),
              Divider(height: 40,
                color: (_currentBrightness == Brightness.light) ? Colors.grey[900]: Colors.white,),
              Column(children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0), // Đặt góc vuông ở đây
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      
                    });
                  },
                  child:const Row(children: [
                    Icon(Icons.image),
                    SizedBox(width: 20,),
                    Text('Change Avatar'),
                  ]),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0), // Đặt góc vuông ở đây
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      
                    });
                  },
                  child:const Row(children: [
                    Icon(Icons.password),
                    SizedBox(width: 20,),
                    Text('Change Password'),
                  ]),
                ),
                const SizedBox(height: 20,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0), // Đặt góc vuông ở đây
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        
                      });
                    },
                    child:const Row(children: [
                      Icon(Icons.mail),
                      SizedBox(width: 20,),
                      Text('Upgrade mail'),
                    ]),
                  ),
              ],),
            ],),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ViewCardMode {
  static Widget buildCardMode(BuildContext context, bool isGridView, Brightness currentBrightness, List<Map<String, dynamic>> notesPinned) {
    if(!isGridView) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: notesPinned.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // if(isPinned)
                  ListTile(
                    title:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notesPinned[index]["title"] ?? "",
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IndieFlower',
                      ),),
                      Container(
                        height: 2, 
                        color: (currentBrightness == Brightness.light) ? Colors.grey[500]: Colors.white,
                      ),
                    ],),
                    subtitle: Text("Date: ${notesPinned[index]["date"] ?? ""}"),
                    trailing: Text('Work'),
                    onTap: () {
                      // Handle item tap
                      // print("Tapped on ${notesPinned[index]["title"]}");
                      Navigator.pushNamed(context, '/viewNote');
                    },
                  ),
                ],
              ),
            );
          },
        ); }
        else {
         return Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: notesPinned.map((note) {
          return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // if(isPinned)
                  ListTile(
                    title:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(note["title"] ?? "",
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IndieFlower',
                      ),),
                      Container(
                        height: 2, 
                        color: (currentBrightness == Brightness.light) ? Colors.grey[500]: Colors.white,
                      ),
                    ],),
                    subtitle: Text("Date: ${note["date"] ?? ""}"),
                    trailing: Text('Work'),
                    onTap: () {
                      // Handle item tap
                      Navigator.pushNamed(context, '/viewNote');
                    },
                  ),
                ],
              ),
            );
        }).toList()
        ,);
    }
  }
   static Widget buildNotesGrid(BuildContext context,bool isGridView, Brightness currentBrightness, List<Map<String, dynamic>> notesPinned) {
    if (!isGridView) {
      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: notesPinned.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 5,
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // if(isPinned)
                                ListTile(
                                  title:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(notesPinned[index]["title"] ?? "",
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'IndieFlower',
                                    ),),
                                    Container(
                                      height: 2, 
                                      color: (currentBrightness == Brightness.light) ? Colors.grey[500]: Colors.white,
                                    ),
                                  ],),
                                  subtitle: Text("Date: ${notesPinned[index]["date"] ?? ""}"),
                                  trailing: Text('Work'),
                                  onTap: () {
                                    // Handle item tap
                                    // print("Tapped on ${notesPinned[index]["title"]}");
                                    Navigator.pushNamed(context, '/viewNote');
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
    } else {
      return Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: notesPinned.map((note) {
                        return Card(
                            elevation: 5,
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // if(isPinned)
                                ListTile(
                                  title:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(note["title"] ?? "",
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'IndieFlower',
                                    ),),
                                    Container(
                                      height: 2, 
                                      color: (currentBrightness == Brightness.light) ? Colors.grey[500]: Colors.white,
                                    ),
                                  ],),
                                  subtitle: Text("Date: ${note["date"] ?? ""}"),
                                  trailing: Text('Work'),
                                  onTap: () {
                                    // Handle item tap
                                    Navigator.pushNamed(context, '/viewNote');
                                  },
                                ),
                              ],
                            ),
                          );
                      }).toList()
                      ,);
    }
  }
}
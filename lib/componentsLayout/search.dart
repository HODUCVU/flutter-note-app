import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
class Search {
  static void showSearchDialog(BuildContext context, List<String> search) {
    // https://pub.dev/packages/searchfield
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Search card'),
          content: Column(
            children: [
              SearchField(
                onSearchTextChanged: (query) {
                  final filter = search
                    .where((element) =>
                      element!.toLowerCase().contains(query.toLowerCase()))
                    .toList();
                return filter
                    .map((e) => SearchFieldListItem<String>('${e}',
                        child: Text('${e}',
                          style: TextStyle(fontSize: 10, color: Colors.green)),
                      )).toList();
                },
                key: const Key('searchfield'),
                hint: 'Search by note title',
                itemHeight: 20,
                searchInputDecoration:
                  const InputDecoration(hintStyle: TextStyle(color: Colors.red)),
                suggestionsDecoration: SuggestionDecoration(
                  padding: const EdgeInsets.all(4),
                  border: Border.all(color: Colors.red),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
                  suggestions: search
                    .map((e) => SearchFieldListItem<String>('${e}',
                    child: 
                       Text('${e}',
                          style: TextStyle(fontSize: 10, color: Colors.green)),
                      )).toList(),
                    onSuggestionTap: (SearchFieldListItem<String> x) {
                    },
                  ),
                ],
              ),
          
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
            TextButton(onPressed: () {
              Navigator.of(context).pop();
              // move to view note layout
              // title has from SearchField
            }, child: const Text('Ok'))
          ],
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:note_list_app/componentsLayout/dialog.dart';
import 'package:note_list_app/componentsLayout/handle.dart';
import 'package:note_list_app/componentsLayout/menu.dart';
import 'package:note_list_app/datacontext/dataStruct.dart';

// var item = 1;

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  // Config Text
  double _fontSize = 16.0;
  FontWeight _fontWeight = FontWeight.normal;
  FontStyle _fontStyle = FontStyle.normal;
  Color _textColor = Colors.black;
  // Style config
  late TextStyle _titleStyle;
  late TextStyle _notesStyle;
  //tag
  late List<String> tags;
  late String selectedItem;
  //title
  late TextEditingController _titleInput;
  late FocusNode _focusNodeTitle;
  //Notes
  late TextEditingController _notesInput;
  late FocusNode _focusNodeNotes;
  //avarta
  late List<String> images;
  //theme
  late Brightness _currentBrightness;
  final bool _isDarkModeEnabled = false;

  @override
  void initState() {
    super.initState();
    _currentBrightness = CurrentBrightness;
    tags = ['Spend', 'Work', 'School', 'Exercise', 'Bank'];
    selectedItem = 'Spend';
    images = ['avarta.jpeg'];

    _titleStyle = const TextStyle(fontSize: 25.0, fontWeight: FontWeight.normal, fontStyle: FontStyle.normal, color: Colors.black);
    _notesStyle = const TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, fontStyle: FontStyle.normal, color: Colors.black);

    _titleInput = TextEditingController();
    _focusNodeTitle = FocusNode();
    _notesInput = TextEditingController();
    _focusNodeNotes = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(data: _currentBrightness == Brightness.light ? Handle.lightTheme : Handle.darkTheme,
      child: Scaffold(
        backgroundColor: (_currentBrightness == Brightness.light) ? Colors.blue[100]: Colors.grey[500],
        appBar: AppBar(
          title: const Text(
            "Create Note",
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
                    icon: const Icon(Icons.access_alarm),
                    onPressed: () {
                        // -> show dialog clock
                        DialogEvents.showNotificationDialog(context);
                    },
                  ),
                  const SizedBox(width: 5,),
                  IconButton(
                    icon: const Icon(Icons.save, color: Colors.blue,),
                    onPressed: () {
                      if (_titleInput.text.isEmpty) {
                        _focusNodeTitle.requestFocus();
                        DialogEvents.showToast(context, "Title is Empty");
                      } else if(_notesInput.text.isEmpty) {
                        _focusNodeNotes.requestFocus();
                         DialogEvents.showToast(context, "Note is Empty");
                      } 
                      else {
                        // -> move on view note layout and save data
                         DialogEvents.showToast(context, "Saved Note");
                        _notesInput.text = '';
                        _titleInput.text = '';
                      }
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
                      child: const Icon(Icons.push_pin),
                    ),
                    onPressed: () {
                      //  make pin == true
                    },
                  ),
                  const SizedBox(width: 5,),
                  Menu.buildPopupMenuButton(context,)
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
          child: Padding(padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Column(children: [
                TextField(
                  controller: _titleInput,
                  focusNode: _focusNodeTitle,
                  style: _titleStyle,
                  onChanged: (value) {
                    setState(() {
                      _titleStyle = _titleStyle.copyWith(
                        fontSize: _fontSize,
                        fontWeight: _fontWeight,
                        fontStyle: _fontStyle,
                        color: _textColor,
                      );
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    hintText: 'Enter your title',
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.title),
                    hintStyle: TextStyle(
                      fontSize: 25.0
                    ),
                    
                  ),
                ),
                // Dropdown - tag
                const SizedBox(height: 20,),
               Row(
                children: [
                  const Icon(Icons.tag),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: selectedItem,
                        items: tags.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            selectedItem = newValue;
                          }
                        },
                      ),
                    ),
                  ),
                ],),

                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Slider(
                      value: _fontSize,
                      min: 10.0,
                      max: 30.0,
                      onChanged: (value) {
                        setState(() {
                          _fontSize = value;
                        });
                    },),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _fontWeight =
                              _fontWeight == FontWeight.normal ? FontWeight.bold : FontWeight.normal;
                        });
                      },
                      child: const Icon(Icons.format_bold),
                    ),
                    const SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _fontStyle =
                              _fontStyle == FontStyle.normal ? FontStyle.italic : FontStyle.normal;
                        });
                      },
                      child: const Icon(Icons.format_italic),
                    ),
                    const SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectTextColor(context);
                        });
                      },
                      child: const Icon(Icons.color_lens),
                    ),

                ],),
                const SizedBox(height: 20,),
                Container(height: 2,
                color: (_currentBrightness == Brightness.light)? Colors.grey[500]:Colors.white),
                const SizedBox(height: 20,),
                TextField(
                  controller: _notesInput,
                  focusNode: _focusNodeNotes,
                  style: _notesStyle,
                  onChanged: (value) {
                    setState(() {
                      _notesStyle = _notesStyle.copyWith(
                        fontSize: _fontSize,
                        fontWeight: _fontWeight,
                        fontStyle: _fontStyle,
                        color: _textColor,
                      );
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Notes',
                    hintText: 'Enter your Notes',
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.note),
                    hintStyle: TextStyle(
                      fontSize: 15.0
                    )
                  ),
                  maxLines: null, 
                  minLines: 5,  
                  keyboardType: TextInputType.multiline,
                ),
                
              ]),
          ),
        ),
      ));
  }
  _selectTextColor(BuildContext context) async {
    Color? selectedColor = await showDialog<Color>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Text Color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _textColor,
              onColorChanged: (Color color) {
                setState(() {
                  _textColor = color;
                });
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    if (selectedColor != null) {
      setState(() {
        _textColor = selectedColor;
      });
    }
  }
}
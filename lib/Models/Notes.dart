import 'package:flutter/material.dart';

class Notes {
  String _title;
  String _tag;
  String _notes;
  TextStyle _titleStyle;
  TextStyle _notesStyle;
  Notes(this._title, this._tag, this._notes, this._titleStyle, this._notesStyle);
  
  String get title => _title;
  String get tag => _tag;
  String get notes => _notes;
  TextStyle get titleStyle => _titleStyle;
  TextStyle get notesStyle => _notesStyle;

  set title(String value) => _title = value;
  set tag(String value) => _tag = value;
  set notes(String value) => _notes = value;
  set titleStyle(TextStyle value) => _titleStyle = value;
  set notesStyle(TextStyle value) => _notesStyle = value;
}
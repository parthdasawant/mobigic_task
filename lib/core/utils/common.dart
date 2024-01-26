import 'package:flutter/material.dart';

class Common{
  static late final List<Widget> dicBookSelections;
  static var wordLenSelectionColors = [
    Colors.green[300],
    Colors.green[500],
    Colors.teal[300],
    Colors.teal[500],
    Colors.orange[400],
  ];
  static var chancesSelectionColors = [
    Colors.green[700],
    Colors.teal[600],
    Colors.teal[400],
    Colors.blue[600],
    Colors.blue[400],
    Colors.cyan,
    Colors.orange[400],
    Colors.deepOrange[600],
  ];

  static List<TextEditingController> populateList() {
    List<TextEditingController> list = [];
    final textController1 = TextEditingController();
    final textController2 = TextEditingController();
    final textController3 = TextEditingController();
    final textController4 = TextEditingController();
    final textController5 = TextEditingController();
    final textController6 = TextEditingController();
    final textController7 = TextEditingController();
    final textController8 = TextEditingController();
    list.add(textController1);
    list.add(textController2);
    list.add(textController3);
    list.add(textController4);
    list.add(textController5);
    list.add(textController6);
    list.add(textController7);
    list.add(textController8);
    return list;
  }

  static List<List<String>> createGrid(List<String> inputList) {
    final List<List<String>> result = [];
    for (String str in inputList) {
      List<String> charList = str.split('').toList();
      result.add(charList);
    }
    return result;
  }

}
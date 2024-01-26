import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/selection_group_provider.dart';
import '../../widgets/single_selection_box.dart';
import '../word_matching_screen/word_matching_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int wordLen = 5;
  int maxChances = 6;

  late final List<Widget> dicBookSelections;
  var wordLenSelectionColors = [
    Colors.green[300],
    Colors.green[500],
    Colors.teal[300],
    Colors.teal[500],
    Colors.orange[400],
  ];
  var chancesSelectionColors = [
    Colors.green[700],
    Colors.teal[600],
    Colors.teal[400],
    Colors.blue[600],
    Colors.blue[400],
    Colors.cyan,
    Colors.orange[400],
    Colors.deepOrange[600],
  ];

  late List<TextEditingController> list;

  List<TextEditingController> populateList() {
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

  List<List<String>> createGrid(List<String> inputList) {
    final List<List<String>> result = [];
    for (String str in inputList) {
      List<String> charList = str.split('').toList();
      result.add(charList);
    }
    return result;
  }

  late bool isAndroid;

  @override
  void initState() {
    super.initState();
    isAndroid = Platform.isAndroid;
    list = populateList();
  }

  @override
  void dispose() {
    // list.clear();
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool validateForm() {
    if (_formKey.currentState!.validate()) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.18;
    return Scaffold(

        appBar: AppBar(
          scrolledUnderElevation:0.0,
          title: const Text("MOBIGIC"),
        ),
        body: SizedBox(
            width: double.infinity,
            // height: double.infinity,
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: height,
                        decoration: BoxDecoration(
                          color: wordLenSelectionColors[wordLen - 4]!
                              .withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  15.0, 10.0, 0.0, 10.0),
                              child: Text(
                                'Max Columns',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: wordLenSelectionColors[wordLen - 4]!,
                                ),
                              ),
                            ),
                            SelectionGroupProvider(
                              defaultSelection: 5,
                              onChanged: (sel) => setState(() => wordLen = sel),
                              selections: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    for (int i = 4; i <= 8; i++)
                                      generateSelectionBox(
                                        id: i,
                                        width: 80.0,
                                        height: 80.0,
                                        color: wordLenSelectionColors[i - 4]!,
                                        primaryText: '$i',
                                        primaryTextSize: 25.0,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: height,
                        decoration: BoxDecoration(
                          color: chancesSelectionColors[maxChances - 1]!
                              .withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  15.0, 10.0, 0.0, 10.0),
                              child: Text(
                                'Max Rows',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      chancesSelectionColors[maxChances - 1]!,
                                ),
                              ),
                            ),
                            SelectionGroupProvider(
                              defaultSelection: 6,
                              onChanged: (sel) =>
                                  setState(() => maxChances = sel),
                              selections: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    for (int i = 1; i <= 8; i++)
                                      generateSelectionBox(
                                        id: i,
                                        width: 80.0,
                                        height: 80.0,
                                        color: chancesSelectionColors[i - 1]!,
                                        primaryText: '$i',
                                        primaryTextSize: 25.0,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: isAndroid ? height * 2.25 : height * 2,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Fill letters row-wise',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Column(
                                        children: [
                                          for (int i = 1; i <= maxChances; i++)
                                            TextFormField(
                                              controller: list[i - 1],
                                              textCapitalization: TextCapitalization.characters,
                                              maxLength: wordLen,
                                              keyboardType: TextInputType.text,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(r'[a-zA-Z]')),
                                              ],
                                              decoration: InputDecoration(
                                                  hintText: 'Row No. $i',
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'This field is required';
                                                } else if (value.length !=
                                                    wordLen) {
                                                  return 'Enter $wordLen alphabets';
                                                }
                                                return null;
                                              },
                                            )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: double.infinity,
                                height: height * 0.4,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 30, left: 30, top: 4, bottom: 4),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.indigo,
                                    ),
                                    onPressed: () {
                                      if (validateForm()) {
                                        List<String> row = [];
                                        for (int i = 1; i <= maxChances; i++) {
                                          row.add(list[i - 1].text.trim().toUpperCase());
                                        }
                                        List<List<String>> grid =
                                            createGrid(row);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  WordMatchingScreen(
                                                      grid: grid,
                                                  m: wordLen,
                                                  n: maxChances)),
                                        );
                                      }
                                    },
                                    child:  Text("Create Grid",
                                        style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white)
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]))));
  }
}

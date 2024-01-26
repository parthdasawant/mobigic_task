import 'dart:io';

import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_form.dart';
import '../../widgets/widgets_export.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int maxChances = 4;
  int wordLen = 4;

  late List<TextEditingController> list;

  late bool isAndroid;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    isAndroid = Platform.isAndroid;
    list = Common.populateList();
  }

  void handleWordLenChange(int newWordLen) {
    setState(() {
      wordLen = newWordLen;
    });
  }

  void handleMaxChancesChange(int newMaxChances) {
    setState(() {
      maxChances = newMaxChances;
    });
  }

  @override
  void dispose() {
    // list.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.18;
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          title: const Text("MOBIGIC"),
        ),
        body: SizedBox(
            width: double.infinity,
            // height: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  MaxCols(
                    height: height,
                    maxChances: maxChances,
                    wordLen: wordLen,
                    onWordLenChanged: handleWordLenChange,
                  ),
                  MaxRows(
                    height: height,
                    maxChances: maxChances,
                    wordLen: wordLen,
                    onMaxChancesChanged: handleMaxChancesChange,
                  ),
                  CustomForm(
                      isAndroid: isAndroid,
                      height: height,
                      list: list,
                      formKey: formKey,
                      maxChances: maxChances,
                      wordLen: wordLen)
                ],
              ),
            )));
  }
}

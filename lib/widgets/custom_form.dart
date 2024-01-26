import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/app_export.dart';
import '../presentation/word_matching_screen/word_matching_screen.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({
    super.key,
    required this.isAndroid,
    required this.height,
    required this.list,
    required this.formKey,
    required this.wordLen,
    required this.maxChances
  }) ;
  final bool isAndroid;
  final double height;
  final List<TextEditingController> list;
  final GlobalKey<FormState> formKey;
  final int wordLen;
  final int maxChances;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  @override
  Widget build(BuildContext context) {

    bool validateForm() {
      if (widget.formKey.currentState!.validate()) {
        return true;
      }
      return false;
    }

    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: widget.isAndroid ? widget.height * 2.25 : widget.height * 2,
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
                        for (int i = 1; i <= widget.maxChances; i++)
                          TextFormField(
                            controller: widget.list[i - 1],
                            textCapitalization:
                            TextCapitalization.characters,
                            maxLength: widget.wordLen,
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z]')),
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
                                  widget.wordLen) {
                                return 'Enter ${widget.wordLen} alphabets';
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
              height: widget.height * 0.4,
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
                      for (int i = 1; i <= widget.maxChances; i++) {
                        row.add(widget.list[i - 1]
                            .text
                            .trim()
                            .toUpperCase());
                      }
                      List<List<String>> grid =
                      Common.createGrid(row);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WordMatchingScreen(
                                    grid: grid,
                                    m: widget.wordLen,
                                    n: widget.maxChances)),
                      );
                    }
                  },
                  child: Text("Create Grid",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: Colors.white)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
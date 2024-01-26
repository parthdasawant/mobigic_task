import 'package:flutter/material.dart';
import 'package:mobigic_task/widgets/selection_group_provider.dart';
import 'package:mobigic_task/widgets/single_selection_box.dart';

import '../core/utils/common.dart';

class MaxCols extends StatefulWidget {
  MaxCols({
    super.key,
    required this.height,
    required this.wordLen,
    required this.maxChances,
    required this.onWordLenChanged

  });
  final double height;
  final int wordLen;
  final int maxChances;
  final Function(int) onWordLenChanged;

  @override
  State<MaxCols> createState() => _MaxColsState();
}

class _MaxColsState extends State<MaxCols> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: widget.height,
        decoration: BoxDecoration(
          color: Common.wordLenSelectionColors[widget.wordLen - 4]!
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
                  color: Common.wordLenSelectionColors[widget.wordLen - 4]!,
                ),
              ),
            ),
            SelectionGroupProvider(
              defaultSelection: widget.wordLen,
              onChanged: (sel){
                widget.onWordLenChanged(sel);
    },
              selections: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 4; i <= 8; i++)
                      generateSelectionBox(
                        id: i,
                        width: 80.0,
                        height: 80.0,
                        color: Common.wordLenSelectionColors[i - 4]!,
                        primaryText: '$i',
                        primaryTextSize: 25.0,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ));

  }
}

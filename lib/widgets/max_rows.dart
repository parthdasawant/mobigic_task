import 'package:flutter/material.dart';
import 'package:mobigic_task/widgets/widgets_export.dart';

import '../core/app_export.dart';

class MaxRows extends StatefulWidget {
   const MaxRows({
    super.key,
    required this.height,
     required this.wordLen,
     required this.maxChances,
     required this.onMaxChancesChanged,
  });

  final double height;
   final int wordLen;
   final int maxChances;
   final Function(int) onMaxChancesChanged;

   @override
  State<MaxRows> createState() => _MaxRowsState();
}

class _MaxRowsState extends State<MaxRows> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.height,
      decoration: BoxDecoration(
        color: Common.chancesSelectionColors[widget.maxChances - 1]!
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
                Common.chancesSelectionColors[widget.maxChances - 1]!,
              ),
            ),
          ),
          SelectionGroupProvider(
            defaultSelection: widget.maxChances,
            onChanged: (sel) =>
    widget.onMaxChancesChanged(sel),
            selections: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 1; i <= 8; i++)
                    generateSelectionBox(
                      id: i,
                      width: 80.0,
                      height: 80.0,
                      color: Common.chancesSelectionColors[i - 1]!,
                      primaryText: '$i',
                      primaryTextSize: 25.0,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


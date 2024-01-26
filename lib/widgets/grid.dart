import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  const Grid({
    super.key,
    required this.grid,
    required this.m,
    required this.n,
    required this.matchedIndex
  });
  final List<List<String>> grid;
  final int m;
  final int n;
  final List<int> matchedIndex;

  @override
  Widget build(BuildContext context) {
    List<String> flattenedList = grid.expand((sublist) => sublist).toList();
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(36, 20, 36, 20),
        itemCount: m * n,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            crossAxisCount: m
        ),
        itemBuilder: (context, index){
        bool isContains = matchedIndex.contains(index);
          return Container(
            decoration: BoxDecoration(
              border: Border.all(),
                  color: isContains ? Colors.green: Colors.white
            ),
            // color: Colors.grey.shade200,
            child: Center(child: Text(flattenedList[index],
              style: TextStyle(fontSize: (58 - (m * 4)), fontWeight: FontWeight.bold,
              color: isContains ?  Colors.white : Colors.grey
              )
              ,)),
          );
        });
  }
}
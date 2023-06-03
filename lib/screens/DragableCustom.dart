import 'package:flutter/material.dart';

class DragableCustom extends StatefulWidget {
  final String title;

  const DragableCustom({Key? key, required this.title}) : super(key: key);

  @override
  State<DragableCustom> createState() => _DragableCustomState();
}

class _DragableCustomState extends State<DragableCustom> {
  List<String> items = List.generate(18, (index) => "$index");

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.of(context).pop(),
          )),
      body: SafeArea(
        child: ReorderableListView(
          onReorder: (int oldIndex, int newIndex) {
            if (newIndex > oldIndex) newIndex--;
            items.insert(newIndex, items.removeAt(oldIndex));

            setState(() {});
          },
          children: items
              .map(
                (e) => Padding(
                  key: ValueKey("$e"),
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$e',
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

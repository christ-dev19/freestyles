import 'package:flutter/material.dart';

class DraggableCustom extends StatefulWidget {
  final String title;

  const DraggableCustom({Key? key, required this.title}) : super(key: key);

  @override
  State<DraggableCustom> createState() => _DraggableCustomState();
}

class _DraggableCustomState extends State<DraggableCustom> {
  List<String> items = List.generate(18, (index) => "$index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          leading: IconButton(
            icon: const Icon(
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
                  key: ValueKey(e),
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    e,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

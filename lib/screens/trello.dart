import 'package:flutter/material.dart';

// https://docs.flutter.dev/release/breaking-changes/default-scroll-behavior-drag

// added this line to main.dart to add dragging behaviour
//  scrollBehavior: MaterialScrollBehavior().copyWith(dragDevices: {PointerDeviceKind.mouse}),

class Trello extends StatelessWidget {
  const Trello({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trello'),
        actions: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text("Add Board"),
          )
        ],
      ),
      body: const NewWidget(),
    );
  }
}

class NewWidget extends StatefulWidget {
  const NewWidget({super.key});

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  List array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
      ),
      child: ReorderableListView(
        buildDefaultDragHandles: false,
        padding: const EdgeInsets.only(bottom: 100),
        scrollDirection: Axis.horizontal,
        onReorder: ((oldIndex, newIndex) {
          setState(() {
            var temp = array[oldIndex];
            array.removeAt(oldIndex);
            array.insert(newIndex, temp);
          });
        }),
        children: [
          for (final item in array)
            Padding(
              key: ValueKey(item),
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: [
                    ReorderableDragStartListener(
                      index: item,
                      child: const SizedBox(
                        width: 200,
                        height: 50,
                        child: Center(child: Text('Enter List Title')),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: 200,
                        height: 100,
                        color: Colors.amber,
                        child: Center(child: Text(item.toString())),
                      ),
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

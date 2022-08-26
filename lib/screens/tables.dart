// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Tables extends StatefulWidget {
  const Tables({Key? key}) : super(key: key);

  @override
  State<Tables> createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  int row = 3;
  int column = 3;

  List<TableRow> tableMaker(int row, int column) {
    List<TableRow> t = List<TableRow>.generate(row, (r) {
      return TableRow(
          children: List<Text>.generate(
              column,
              (c) => Text(
                    '${r + 1} , ${c + 1}',
                    textAlign: TextAlign.center,
                  )));
    });
    return t;
  }

  List<Widget> _buildCells(int count) {
    return List.generate(
      count,
      (index) => Container(
        alignment: Alignment.center,
        width: 80.0,
        height: 50.0,
        margin: EdgeInsets.all(4.0),
        child:
            Text("${index + 1}", style: Theme.of(context).textTheme.headline4),
      ),
    );
  }

  List<Widget> _buildRows(int count) {
    return List.generate(
      count,
      (index) => Row(
        children: _buildCells(column),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sample Table',
                  style: Theme.of(context).textTheme.headline4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                      icon: Icon(Icons.arrow_downward_rounded),
                      onPressed: () => setState(() => row++),
                      label: Text('Add New Row')),
                  ElevatedButton.icon(
                      icon: Icon(Icons.arrow_forward_rounded),
                      onPressed: () => setState(() => column++),
                      label: Text('Add New Column')),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                  // defaultColumnWidth: FixedColumnWidth(50),
                  border: TableBorder.all(),
                  children: tableMaker(row, column),
                ),
              ),
              SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildCells(row),
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _buildRows(row),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

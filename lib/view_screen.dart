import 'package:flutter/material.dart';
import 'dart:math';

class PlayGround extends StatefulWidget {
  final int rows;
  final int columns;

  const PlayGround({Key? key, required this.rows, required this.columns})
      : super(key: key);

  @override
  State<PlayGround> createState() => _PlayGroundState();
}

class _PlayGroundState extends State<PlayGround> {
  final Icon star = const Icon(Icons.star);
  final Icon alarm = const Icon(Icons.access_alarm);
  Random random = Random();
  late int starRow;
  late int starColumn;
  late int alarmRow;
  late int alarmColumn;

  @override
  void initState() {
    super.initState();
    generatePositions();
  }

  void generatePositions() {
    starRow = random.nextInt(widget.rows);
    starColumn = random.nextInt(widget.columns);
    alarmRow = random.nextInt(widget.rows);
    alarmColumn = random.nextInt(widget.columns);

    if (starRow == alarmRow || starColumn == alarmColumn) {
      generatePositions();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(
            height: 160,
          ),
          Table(
            children: [
              for (int i = 0; i < widget.rows; i++)
                TableRow(children: [
                  for (int j = 0; j < widget.columns; j++)
                    Container(
                      decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                      child: (i == starRow && j == starColumn)
                          ? star
                          : (i == alarmRow && j == alarmColumn)
                          ? alarm
                          : const SizedBox(
                        height: 60,
                        width: 60,
                      ),
                    ),
                ]),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                generatePositions();
              });
            },
            child: const Text('Change Position'),
          ),
        ],
      ),
    );
  }
}
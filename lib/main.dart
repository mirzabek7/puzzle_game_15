import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './widgets/table_item.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
      home: Game(),
    );
  }
}

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  List<String> items =
      List.generate(16, (index) => index == 0 ? "" : index.toString());

  List<String> checkItem = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    ""
  ];

  void changeIndex(int index) {
    int isEmpty = items.lastIndexOf("");
    int previousItem = index - 1;
    int nextItem = index + 1;
    int previousRow = index - 4;
    int nextRow = index + 4;
    if (isEmpty == previousItem) {
      setState(() {
        items[previousItem] = items[index];
        items[index] = "";
      });
    }
    if (isEmpty == nextItem) {
      setState(() {
        items[nextItem] = items[index];
        items[index] = "";
      });
    }
    if (isEmpty == previousRow) {
      setState(() {
        items[previousRow] = items[index];
        items[index] = "";
      });
    }
    if (isEmpty == nextRow) {
      setState(() {
        items[nextRow] = items[index];
        items[index] = "";
      });
    }
  }

  @override
  void initState() {
    items.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int checkIsEnd() {
      int count = 0;
      for (int i = 0; i < 16; i++) {
        if (checkItem[i] == items[i]) {
          count++;
        }
      }
      return count;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("15 Puzzle Game"),
      ),
      body: Center(
        child: checkIsEnd() < 16
            ? AspectRatio(
                aspectRatio: 1,
                child: GridView.count(
                  crossAxisCount: 4,
                  children: [
                    for (int i = 0; i < 16; i++)
                      InkWell(
                        onTap: () {
                          changeIndex(i);
                        },
                        child: TableItem(items: items, i: i),
                      ),
                  ],
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/winner.png",
                    fit: BoxFit.cover,
                    width: 200,
                  ),
                  const Text(
                    "YOU WIN!",
                    style: TextStyle(
                        fontSize: 45,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        items.shuffle();
                      });
                    },
                    icon: const Icon(
                      Icons.restart_alt,
                      size: 35,
                    ),
                    label: const Text(
                      "Restart",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

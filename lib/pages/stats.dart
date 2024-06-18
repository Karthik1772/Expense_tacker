import 'package:expense_tracker/pages/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(//main column starts
          children: [
             Row(//top row starts
              children: [
                IconButton(onPressed: (){HomeScreen();}, icon: Icon(CupertinoIcons.arrow_left))
              ],
             )//top row ends
          ],
        ),//main column ends
      ),
    );
  }
}

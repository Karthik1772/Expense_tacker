import 'package:expense_tracker/pages/HomePage/homescreen.dart';
import 'package:expense_tracker/pages/StatisticsPage/chart.dart';
import 'package:fl_chart/fl_chart.dart';
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
        child: Column(
            //main column starts
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //top row starts
                children: [
                  Text(
                    "Trasactions",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.settings),
                  )
                ],
              ), //top row ends
              SizedBox(
                height: 20,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: Chart())
            ]), //main column ends
      ),
    );
  }
}

import 'dart:math';

import 'package:expense_tracker/pages/HomePage/homescreen.dart';
import 'package:expense_tracker/pages/StatisticsPage/stats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Theme.of(context).colorScheme.tertiary,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },currentIndex: index,
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 3,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.graph_square), label: "Stats"),
            ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: CircleBorder(),
          child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.tertiary,
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.primary,
                    ],
                    transform: GradientRotation(pi / 4),
                  )),
              child: Icon(CupertinoIcons.add)),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: index == 0 ? HomeScreen() : Stats());
  }
}

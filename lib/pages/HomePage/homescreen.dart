import 'dart:math';
import 'package:expense_tracker/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          //main column starts
          children: [
            Row(
              //top row starts
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  //inner row starts
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.orange,
                      child: Icon(
                        CupertinoIcons.person_alt_circle_fill,
                        size: 45,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        children: [
                          Text(
                            "Welcome!",
                            style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).colorScheme.outline),
                          ),
                          Text(
                            "Kashyap",
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).colorScheme.onSurface),
                          ),
                        ],
                      ),
                    ),
                  ],
                ), //inner row ends
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.settings),
                )
              ],
            ), //outer row ends
            const SizedBox(
              height: 20,
            ),
            Container(
              //card container start
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.tertiary,
                  ], transform: GradientRotation(pi / 4)),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 20,
                        color: Colors.black,
                        offset: Offset(5, 5))
                  ]),
              child: Column(
                //card column starts
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Total Balance",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                        fontSize: 16),
                  ),
                  Text(
                    "\$ 4800.00",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                        fontSize: 30),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      //card main row starts
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          //card row 1 starts
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: Colors.white30,
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Icon(
                                  CupertinoIcons.arrow_up,
                                  size: 20,
                                  color: Colors.greenAccent,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              //inner column 1 starts
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Income",
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                      fontSize: 14),
                                ),
                                Text(
                                  "\$ 2500.00",
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                      fontSize: 18),
                                )
                              ],
                            ) //inner column 1 ends
                          ],
                        ), //card row 1 ends
                        Row(
                          //card row 2 starts
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: Colors.white30,
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Icon(
                                  CupertinoIcons.arrow_down,
                                  size: 20,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              //inner column 2 starts
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Expenses",
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                      fontSize: 14),
                                ),
                                Text(
                                  "\$ 800.00",
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                      fontSize: 18),
                                )
                              ],
                            ) //inner column 2 ends
                          ],
                        )
                      ],
                    ),
                  ), //card main row  ends
                ],
              ), //card column ends
            ), //card container ends
            const SizedBox(
              height: 25,
            ),
            Row(
              //row starts
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transactions",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "View All",
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.outline,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ), //row ends
            Expanded(
              child: ListView.builder(
                  itemCount: transactionsData.length,
                  itemBuilder: (context, int i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            //builder main row starts
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                //builder row sub starts
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Icon(
                                      transactionsData[i]['icon'],
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    decoration: BoxDecoration(
                                        color: transactionsData[i]['color'],
                                        shape: BoxShape.circle),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    transactionsData[i]['name'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ), //builder sub row ends
                              Column(
                                children: [
                                  Text(
                                    transactionsData[i]['totalAmount'],
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    transactionsData[i]['date'],
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )
                            ],
                          ), //builder main row ends
                        ),
                      ),
                    );
                  }),
            )
          ],
        ), //main column ends
      ),
    );
  }
}

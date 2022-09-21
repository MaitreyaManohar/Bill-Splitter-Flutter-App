import 'package:billsplitterapp/Classes/add_card.dart';
import 'package:flutter/material.dart';
import 'colors_theme.dart';
import 'list_people.dart';
import 'calculation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<List> _details = [];
  final List<List> _detailsCalculation = [];
  int clickCalculateCount = 0;

  String finalString = "";
  void onAdd(String name, double cost) {
    setState(() {
      _details.add([name, cost]);
      _detailsCalculation.add([name, cost]);
    });
  }

  void onDelete(int index) {
    setState(() {
      _details.removeAt(index);
      _detailsCalculation.removeAt(index);
      clickCalculateCount=0;
    });
  }

  void onCalculate() {
    setState(() {
      finalString = (clickCalculateCount == 0)
          ? mainCalculator(_detailsCalculation)
          : finalString;
      clickCalculateCount++;
    });
  }

  void onReset() {
    setState(() {
      _details.clear();
      _detailsCalculation.clear();
      finalString = "";
      clickCalculateCount=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BillSplitterColors().lightcolor,
      body: Column(
        children: [
          AddCard(onAdd),
          const SizedBox(
            height: 10,
          ),
          PeopleList(_details, onDelete),
          Text(finalString),
          SizedBox(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.calculate,
                    color: BillSplitterColors().maincolor,
                  ),
                  onPressed: onCalculate,
                ),
                IconButton(
                  icon: Icon(
                    Icons.restore,
                    color: BillSplitterColors().maincolor,
                  ),
                  onPressed: onReset,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

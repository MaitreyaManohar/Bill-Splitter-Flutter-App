import 'package:billsplitterapp/Classes/colors_theme.dart';
import 'package:flutter/material.dart';

class PeopleList extends StatelessWidget {
  final List details;
  final Function onDelete;
  PeopleList(this.details, this.onDelete);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 30, right: 30),
        itemBuilder: (_, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: Card(
              elevation: 10,
              color: BillSplitterColors().maincolor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${details[index][0]} paid ${details[index][1]}"),
                    IconButton(
                        onPressed: () {
                          onDelete(index);
                        },
                        icon: const Icon(Icons.delete))
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: details.length,
      ),
    );
  }
}

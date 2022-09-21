import 'package:flutter/material.dart';
import 'colors_theme.dart';

class AddCard extends StatelessWidget {

  final nameController=TextEditingController();
  final costController=TextEditingController();
  Function add;
  AddCard(this.add, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      margin: const EdgeInsets.only(
        top: 40,
        left: 30,
        right: 30,
      ),
      color: BillSplitterColors().maincolor,
      child: SizedBox(
        height: 250,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200.0,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "ENTER NAME",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200.0,
                child: TextField(
                  controller: costController,
                  decoration: InputDecoration(
                    hintText: "ENTER COST",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              IconButton(
                  onPressed: () {
                    add(nameController.text,double.parse(costController.text));
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

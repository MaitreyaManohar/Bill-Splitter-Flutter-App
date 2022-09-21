import 'package:billsplitterapp/Classes/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BillSplitter());
}

class BillSplitter extends StatelessWidget {
  const BillSplitter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        textTheme: GoogleFonts.bebasNeueTextTheme(Theme.of(context).textTheme),
      ),
    );
  }
}

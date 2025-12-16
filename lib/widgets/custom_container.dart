import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.sympol});
  final String sympol;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed("Game Screen", arguments: Arg(sympol: sympol));
      },
      child: Container(
        height: 164,
        width: 164,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white,
          image: DecorationImage(
            scale: 2.5,
            image: AssetImage("assets/$sympol.png"),
          ),
        ),
      ),
    );
  }
}

class Arg {
  String sympol;
  Arg({required this.sympol});
}

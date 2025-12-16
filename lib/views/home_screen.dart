import 'package:flutter/material.dart';
import 'package:tic_tac_toe_xo/widgets/custom_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/backgroundImage.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Pick who goes first?",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    color: Colors.white),
              ),
              SizedBox(
                height: 17,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomContainer(sympol: "x"),
                SizedBox(
                  width: 15,
                ),
                CustomContainer(sympol: "o"),
              ]),
              SizedBox(
                height: 26,
              )
            ],
          ),
        ),
      ),
    );
  }
}

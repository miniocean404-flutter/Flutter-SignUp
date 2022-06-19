// import this Package in pubspec.yaml file
// dependencies:
//
//   slimy_card:

import 'package:flutter/material.dart';

class SlimyCard extends StatefulWidget {
  const SlimyCard({Key? key, required Widget topCardWidget, required Widget bottomCardWidget}) : super(key: key);

  @override
  State<SlimyCard> createState() => _SlimyCardState();
}

class _SlimyCardState extends State<SlimyCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(height: 50),
          SlimyCard(
            topCardWidget: topCardWidget(),
            bottomCardWidget: bottomCardWidget(),
          ),
        ],
      ),
    );
  }

  // This widget will be passed as Top Card's Widget.
  Widget topCardWidget() {
    return Text(
      'customize as you wish.',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white.withOpacity(.85),
      ),
    );
  }

  // This widget will be passed as Bottom Card's Widget.
  Widget bottomCardWidget() {
    return Text(
      'customize as you wish.',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white.withOpacity(.85),
      ),
    );
  }
}

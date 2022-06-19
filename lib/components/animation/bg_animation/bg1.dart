import 'dart:async';

import 'package:flutter/material.dart';

class BgAnimation1 extends StatefulWidget {
  const BgAnimation1({Key? key}) : super(key: key);

  @override
  State<BgAnimation1> createState() => _BgAnimation1State();
}

class _BgAnimation1State extends State<BgAnimation1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AnimatingBg1(),
              ),
            );
          },
          child: const Text('VIEW ANIMATING BACKGROUND'),
        ),
      ),
    );
  }
}

class AnimatingBg1 extends StatefulWidget {
  const AnimatingBg1({Key? key}) : super(key: key);

  @override
  State<AnimatingBg1> createState() => _AnimatingBg1State();
}

class _AnimatingBg1State extends State<AnimatingBg1> with TickerProviderStateMixin {
  List<Color> colorList = [
    const Color(0xff171B70),
    const Color(0xff410D75),
    const Color(0xff032340),
    const Color(0xff050340),
    const Color(0xff2C0340),
  ];
  List<Alignment> alignmentList = [Alignment.topCenter, Alignment.bottomCenter];
  int index = 0;
  Color bottomColor = const Color(0xff092646);
  Color topColor = const Color(0xff410D75);
  Alignment begin = Alignment.bottomCenter;
  Alignment end = Alignment.topCenter;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(microseconds: 0),
      () {
        setState(
          () {
            bottomColor = const Color(0xff33267C);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      onEnd: () {
        setState(
          () {
            index = index + 1;
            bottomColor = colorList[index % colorList.length];
            topColor = colorList[(index + 1) % colorList.length];
          },
        );
      },
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: [bottomColor, topColor],
        ),
      ),
    );
  }
}

// import this Package in pubspec.yaml file
// dependencies:
//
//   flutter_staggered_animations:

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListView1Animation extends StatefulWidget {
  const ListView1Animation({Key? key}) : super(key: key);

  @override
  State<ListView1Animation> createState() => _ListView1AnimationState();
}

class _ListView1AnimationState extends State<ListView1Animation> {
  @override
  Widget build(BuildContext c) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('VIEW ANIMATING LISTVIEW'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SlideAnimation1()),
            );
          },
        ),
      ),
    );
  }
}

class SlideAnimation1 extends StatelessWidget {
  const SlideAnimation1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Go Back"), centerTitle: true, systemOverlayStyle: SystemUiOverlayStyle.light),
      body: AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.all(w / 30),
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: 20,
          itemBuilder: (BuildContext c, int i) {
            return AnimationConfiguration.staggeredList(
              position: i,
              delay: const Duration(milliseconds: 100),
              child: SlideAnimation(
                duration: const Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,
                horizontalOffset: 30,
                verticalOffset: 300.0,
                child: FlipAnimation(
                  duration: const Duration(milliseconds: 3000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  flipAxis: FlipAxis.y,
                  child: Container(
                    margin: EdgeInsets.only(bottom: w / 20),
                    height: w / 4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 40,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

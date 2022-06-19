import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GridViewAnimation extends StatefulWidget {
  const GridViewAnimation({Key? key}) : super(key: key);

  @override
  State<GridViewAnimation> createState() => _GridViewAnimationState();
}

class _GridViewAnimationState extends State<GridViewAnimation> {
  @override
  Widget build(BuildContext c) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('VIEW ANIMATING GRIDVIEW'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const GridView1()),
            );
          },
        ),
      ),
    );
  }
}

class GridView1 extends StatelessWidget {
  const GridView1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    int columnCount = 3;

    return Scaffold(
      appBar: AppBar(title: const Text("Go Back"), centerTitle: true, systemOverlayStyle: SystemUiOverlayStyle.light),
      body: AnimationLimiter(
        child: GridView.count(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          padding: EdgeInsets.all(w / 60),
          crossAxisCount: columnCount,
          children: List.generate(
            50,
            (int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 500),
                columnCount: columnCount,
                child: ScaleAnimation(
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: FadeInAnimation(
                    child: Container(
                      margin: EdgeInsets.only(bottom: w / 30, left: w / 60, right: w / 60),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
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
      ),
    );
  }
}

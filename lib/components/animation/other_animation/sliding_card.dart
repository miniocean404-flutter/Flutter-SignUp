// import this Package in pubspec.yaml file
// dependencies:
//
//   flutter_tindercard:

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_tindercard/flutter_tindercard.dart';

class SlidingCard extends StatefulWidget {
  const SlidingCard({Key? key}) : super(key: key);

  @override
  State<SlidingCard> createState() => _SlidingCardState();
}

class _SlidingCardState extends State<SlidingCard> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    CardController controller; //Use this to trigger swap.

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: width * 1.1,
          child: TinderSwapCard(
            swipeUp: true,
            swipeDown: true,
            orientation: AmassOrientation.BOTTOM,
            totalNum: 10,
            stackNum: 3,
            swipeEdge: 4,
            maxWidth: width * .8,
            maxHeight: width * .8,
            minWidth: width * .6,
            minHeight: width * .79,
            cardBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient:
                      const LinearGradient(colors: [Color(0xff3224AD), Color(0xffC26AD5)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.15),
                      offset: const Offset(0, 5),
                      blurRadius: 40,
                    ),
                  ],
                ),
                child: Text(
                  'Swipe Anywhere...\nPage Index: ${index + 1}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(.7),
                    fontWeight: FontWeight.bold,
                    fontSize: width / 17,
                  ),
                ),
              );
            },
            cardController: controller = CardController(),
            swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
              /// Get swiping card's alignment
              if (align.x < 0) {
                //Card is LEFT swiping
              } else if (align.x > 0) {
                //Card is RIGHT swiping
              }
            },
            swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
              /// Get orientation & index of swiped card!
            },
          ),
        ),
      ),
    );
  }
}

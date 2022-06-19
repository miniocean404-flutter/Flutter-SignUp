import 'package:flutter/material.dart';

class FeedbackButton extends StatefulWidget {
  const FeedbackButton({Key? key}) : super(key: key);

  @override
  State<FeedbackButton> createState() => _FeedbackButtonState();
}

class _FeedbackButtonState extends State<FeedbackButton> with TickerProviderStateMixin {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onHighlightChanged: (value) {
            setState(() {
              isTapped = value;
            });
          },
          onTap: () {},
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastLinearToSlowEaseIn,
            height: isTapped ? 55 : 60,
            width: isTapped ? 150 : 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 30,
                  offset: const Offset(3, 7),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'TAP HERE',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

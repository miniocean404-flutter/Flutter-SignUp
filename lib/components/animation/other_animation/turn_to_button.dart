import 'dart:math';

import 'package:flutter/material.dart';

class TurnToButton extends StatefulWidget {
  const TurnToButton({Key? key}) : super(key: key);

  @override
  State<TurnToButton> createState() => _TurnToButtonState();
}

class _TurnToButtonState extends State<TurnToButton> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation _arrowAnimation;
  late AnimationController _arrowAnimationController;
  bool isTapped = false;

  @override
  void initState() {
    super.initState();
    _arrowAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _arrowAnimation = Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);
  }

  @override
  void dispose() {
    super.dispose();
    _arrowAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: firstChild(),
      ),
    );
  }

  Widget firstChild() {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onHighlightChanged: (value) {
        setState(() {
          isTapped = value;
        });
      },
      onTap: () {
        setState(
          () {
            _arrowAnimationController.isCompleted ? _arrowAnimationController.reverse() : _arrowAnimationController.forward();
          },
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
        height: isTapped ? 45 : 50,
        width: isTapped ? 45 : 50,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 30,
              offset: const Offset(5, 5),
            )
          ],
        ),
        child: AnimatedBuilder(
          animation: _arrowAnimationController,
          builder: (context, child) => Transform.rotate(
            angle: _arrowAnimation.value,
            child: const Icon(
              Icons.expand_more,
              size: 30.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

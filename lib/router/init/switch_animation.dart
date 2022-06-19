import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class SwitchRouteAnimation extends StatefulWidget {
  const SwitchRouteAnimation({Key? key}) : super(key: key);

  @override
  State<SwitchRouteAnimation> createState() => _SwitchRouteAnimationState();
}

class _SwitchRouteAnimationState extends State<SwitchRouteAnimation> {
  bool _onFirstPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PageTransitionSwitcher(
            duration: const Duration(milliseconds: 300),
            reverse: !_onFirstPage,
            transitionBuilder: (Widget child, Animation<double> animation, Animation<double> secondaryAnimation) {
              return SharedAxisTransition(
                  animation: animation, secondaryAnimation: secondaryAnimation, transitionType: SharedAxisTransitionType.horizontal, child: child);
            },
            child: _onFirstPage
                ? Container(
                    key: UniqueKey(),
                    color: Colors.green,
                    height: 200,
                    width: 320,
                  )
                : Container(
                    key: UniqueKey(),
                    color: Colors.pinkAccent,
                    height: 200,
                    width: 320,
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    _onFirstPage = !_onFirstPage;
                  });
                },
                child: Container(
                  height: 50,
                  width: 110,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                      )
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Switch',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

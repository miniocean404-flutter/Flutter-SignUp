import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScaleRouteAnimation extends StatelessWidget {
  const ScaleRouteAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: () => Navigator.push(context, ScaleTransition1(const SecondPage())), child: const Text('TAP  1')),
          ElevatedButton(onPressed: () => Navigator.push(context, ScaleTransition2(const SecondPage())), child: const Text('TAP  2')),
          ElevatedButton(onPressed: () => Navigator.push(context, ScaleTransition3(const SecondPage())), child: const Text('TAP  3')),
          ElevatedButton(onPressed: () => Navigator.push(context, ScaleTransition4(const SecondPage())), child: const Text('TAP  4')),
          ElevatedButton(onPressed: () => Navigator.push(context, ScaleTransition5(const SecondPage())), child: const Text('TAP  5')),
          ElevatedButton(onPressed: () => Navigator.push(context, ScaleTransition6(const SecondPage())), child: const Text('TAP  6')),
          ElevatedButton(onPressed: () => Navigator.push(context, ScaleTransition7(const SecondPage())), child: const Text('TAP  7')),
        ],
      ),
    );
  }
}

class ScaleTransition1 extends PageRouteBuilder {
  final Widget page;

  ScaleTransition1(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(curve: Curves.fastLinearToSlowEaseIn, parent: animation, reverseCurve: Curves.fastOutSlowIn);
            return ScaleTransition(
              alignment: Alignment.bottomCenter,
              scale: animation,
              child: child,
            );
          },
        );
}

class ScaleTransition2 extends PageRouteBuilder {
  final Widget page;

  ScaleTransition2(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(curve: Curves.fastLinearToSlowEaseIn, parent: animation, reverseCurve: Curves.fastOutSlowIn);
            return ScaleTransition(
              alignment: Alignment.topCenter,
              scale: animation,
              child: child,
            );
          },
        );
}

class ScaleTransition3 extends PageRouteBuilder {
  final Widget page;

  ScaleTransition3(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(curve: Curves.fastLinearToSlowEaseIn, parent: animation, reverseCurve: Curves.fastOutSlowIn);
            return ScaleTransition(
              alignment: Alignment.bottomLeft,
              scale: animation,
              child: child,
            );
          },
        );
}

class ScaleTransition4 extends PageRouteBuilder {
  final Widget page;

  ScaleTransition4(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(curve: Curves.fastLinearToSlowEaseIn, parent: animation, reverseCurve: Curves.fastOutSlowIn);
            return ScaleTransition(
              alignment: Alignment.bottomRight,
              scale: animation,
              child: child,
            );
          },
        );
}

class ScaleTransition5 extends PageRouteBuilder {
  final Widget page;

  ScaleTransition5(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(curve: Curves.fastLinearToSlowEaseIn, parent: animation, reverseCurve: Curves.fastOutSlowIn);
            return ScaleTransition(
              alignment: Alignment.center,
              scale: animation,
              child: child,
            );
          },
        );
}

class ScaleTransition6 extends PageRouteBuilder {
  final Widget page;

  ScaleTransition6(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(curve: Curves.fastLinearToSlowEaseIn, parent: animation, reverseCurve: Curves.fastOutSlowIn);
            return ScaleTransition(
              alignment: Alignment.centerRight,
              scale: animation,
              child: child,
            );
          },
        );
}

class ScaleTransition7 extends PageRouteBuilder {
  final Widget page;

  ScaleTransition7(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(curve: Curves.fastLinearToSlowEaseIn, parent: animation, reverseCurve: Curves.fastOutSlowIn);
            return ScaleTransition(
              alignment: Alignment.centerLeft,
              scale: animation,
              child: child,
            );
          },
        );
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Scale Transition'),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    );
  }
}

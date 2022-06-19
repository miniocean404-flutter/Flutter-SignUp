import 'package:flutter/material.dart';

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> with TickerProviderStateMixin {
  late AnimationController controller1;
  late Animation<double> animation1;

  late AnimationController controller2;
  late Animation<double> animation2;

  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation1 = Tween<double>(begin: .0, end: .5).animate(CurvedAnimation(parent: controller1, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
          controller2.forward();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });

    controller2 = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation2 = Tween<double>(begin: .0, end: .5).animate(CurvedAnimation(parent: controller2, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });

    controller1.forward();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 70,
          width: 70,
          child: CustomPaint(
            painter: MyPainter(animation1.value, animation2.value),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double radius_1;
  final double radius_2;

  MyPainter(this.radius_1, this.radius_2);

  @override
  void paint(Canvas canvas, Size size) {
    Paint circle1 = Paint()..color = const Color(0xff4285f4);

    Paint circle2 = Paint()..color = const Color(0xfffbbc05);

    canvas.drawCircle(Offset(size.width * .5, size.height * .5), size.width * radius_1, circle1);

    canvas.drawCircle(Offset(size.width * .5, size.height * .5), size.width * radius_2, circle2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

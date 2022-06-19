import 'package:flutter/material.dart';

class DeformationBar extends StatefulWidget {
  const DeformationBar({Key? key}) : super(key: key);

  @override
  State<DeformationBar> createState() => _DeformationBarState();
}

class _DeformationBarState extends State<DeformationBar> {
  int currentValue = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 90;
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        children: [
          // HOME PAGE
          SizedBox(
            height: size.height,
            width: size.width,
            child: null,
          ),

          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: SizedBox(
              width: size.width,
              height: height,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(size.width * .04),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                  CustomPaint(
                    size: Size(size.width, height),
                    painter: MyPainter(),
                  ),
                  Center(
                    child: SizedBox(
                      width: size.width * .93,
                      height: height,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(
                              currentValue == 0 ? Icons.home : Icons.home_outlined,
                              color: currentValue == 0 ? Colors.orange : Colors.black38,
                            ),
                            onPressed: () {
                              setState(() {
                                currentValue = 0;
                              });
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          IconButton(
                            icon: Icon(
                              currentValue == 1 ? Icons.search : Icons.search_rounded,
                              color: currentValue == 1 ? Colors.orange : Colors.black38,
                            ),
                            onPressed: () {
                              setState(() {
                                currentValue = 1;
                              });
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          IconButton(
                            icon: Icon(
                              currentValue == 2 ? Icons.add_box_rounded : Icons.add,
                              color: currentValue == 2 ? Colors.orange : Colors.black38,
                            ),
                            onPressed: () {
                              setState(() {
                                currentValue = 2;
                              });
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          IconButton(
                            icon: Icon(
                              currentValue == 3 ? Icons.favorite : Icons.favorite_border_rounded,
                              color: currentValue == 3 ? Colors.orange : Colors.black38,
                            ),
                            onPressed: () {
                              setState(() {
                                currentValue = 3;
                              });
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          IconButton(
                            icon: Icon(
                              currentValue == 4 ? Icons.person : Icons.person_outline_rounded,
                              color: currentValue == 4 ? Colors.orange : Colors.black38,
                            ),
                            onPressed: () {
                              setState(() {
                                currentValue = 4;
                              });
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(size.width * .08, size.height * .21); // Start
    path.quadraticBezierTo(size.width * .2, 0, size.width * .35, 0);
    path.quadraticBezierTo(size.width * .6, 0, size.width * .65, 0);
    path.quadraticBezierTo(size.width * .8, 0, size.width * .92, size.height * .21);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

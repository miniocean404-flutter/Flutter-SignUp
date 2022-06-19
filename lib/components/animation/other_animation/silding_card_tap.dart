import 'package:flutter/material.dart';

class SlidingCardTap extends StatefulWidget {
  const SlidingCardTap({Key? key}) : super(key: key);

  @override
  State<SlidingCardTap> createState() => _SlidingCardTapState();
}

class _SlidingCardTapState extends State<SlidingCardTap> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            controller.forward();
          });
        },
        child: CardStack(controller),
      ),
    );
  }
}

class CardStack extends StatefulWidget {
  final AnimationController controller;

  const CardStack(this.controller, {Key? key}) : super(key: key);

  @override
  State<CardStack> createState() => _CardStackState();
}

class _CardStackState extends State<CardStack> {
  late Animation<Offset> slideAnimation;
  late List<SlideCard> cardList;

  @override
  void initState() {
    super.initState();
    cardList = List.generate(
      5,
      (index) => SlideCard(index),
    );
    slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1, 0.0),
    ).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: Curves.ease,
      ),
    );
    widget.controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.controller.reset();
        setState(
          () => cardList.removeLast(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: cardList.map(
        (item) {
          return Transform.translate(
            offset: Offset(0, -item.index * 5.0),
            child: SlideTransition(
              position: getSlideOffset(item.index),
              child: item,
            ),
          );
        },
      ).toList(),
    );
  }

  getSlideOffset(int cardIndex) {
    if (cardIndex == cardList.length - 1) {
      return slideAnimation;
    } else {
      return const AlwaysStoppedAnimation(Offset.zero);
    }
  }
}

class SlideCard extends StatelessWidget {
  final int index;

  const SlideCard(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 300,
        decoration: BoxDecoration(
            color: const Color(0xffFF5050),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ]),
        child: const Center(
          child: Text(
            'Card',
            style: TextStyle(color: Colors.white, fontSize: 100),
          ),
        ),
      ),
    );
  }
}

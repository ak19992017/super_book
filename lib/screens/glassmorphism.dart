// ignore_for_file: prefer_const_constructors

/* https://css.glass -----> For glassmorphism properties */
/* https://api.flutter.dev/flutter/widgets/BackdropFilter-class.html ----->  BackdropFilter Widget docs */

import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class GlassMorphism extends StatefulWidget {
  const GlassMorphism({Key? key}) : super(key: key);

  @override
  State<GlassMorphism> createState() => _GlassMorphismState();
}

class _GlassMorphismState extends State<GlassMorphism>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation translation1;
  late Animation translation2;
  late Animation translation3;
  late Animation rotation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    translation1 = Tween<double>(begin: 20, end: 1000).animate(
      CurvedAnimation(parent: controller, curve: Curves.decelerate),
    );
    translation2 = Tween<double>(begin: 20, end: 700).animate(
      CurvedAnimation(parent: controller, curve: Curves.decelerate),
    );
    translation3 = TweenSequence(
      [
        TweenSequenceItem(tween: Tween(begin: 20.0, end: 60.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 60.0, end: 40.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 40.0, end: 60.0), weight: 1),
      ],
    ).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic));

    rotation = Tween<double>(begin: 0, end: 45).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.1, 0.6, curve: Curves.decelerate)));

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.purpleAccent,
                  Colors.redAccent,
                  Colors.orangeAccent,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          ElevatedButton(
            child: Text(controller.status.toString()),
            onPressed: () {
              controller.repeat(reverse: true);
            },
          ),
          Positioned(
            left: translation2.value / 5,
            bottom: translation2.value / 3,
            child: Transform.rotate(
              angle: rotation.value * pi / 180,
              child: Glass(),
            ),
          ),
          Transform.translate(
            offset: Offset(0, -translation3.value),
            child: Center(
              child: Text(
                "GlassMorphism",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width / 12,
                ),
              ),
            ),
          ),
          Positioned(
            right: translation1.value / 5,
            top: translation1.value / 3,
            child: Transform.rotate(
              angle: rotation.value * pi / 180,
              child: Glass(),
            ),
          ),
        ],
      ),
    );
  }
}

class Glass extends StatelessWidget {
  const Glass({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          constraints: BoxConstraints(
            minWidth: 250,
            maxWidth: 350,
            minHeight: 83.33,
            maxHeight: 116.66,
          ),
          height: MediaQuery.of(context).size.width / 6,
          width: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.2),
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 30,
                color: Color.fromRGBO(0, 0, 0, 0.1),
              )
            ],
            border: Border.all(
              width: 1,
              style: BorderStyle.solid,
              color: Color.fromRGBO(255, 255, 255, 0.3),
            ),
          ),
          child: Center(
            child: Text(
              'Handle with care 🙄',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22.72,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

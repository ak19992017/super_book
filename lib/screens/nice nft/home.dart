import 'package:flutter/material.dart';

import 'package:super_book/screens/nice%20nft/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 75,
        flexibleSpace: const Header(),
      ),
      body: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Row(
          children: [
            Flexible(flex: 1, child: Container()),
            Text.rich(
              TextSpan(
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xfff9f9f9)),
                children: [
                  const TextSpan(text: 'Ready to get\nstarted ?'),
                  TextSpan(
                    text: "\nExplore, sell and create your NFTs.",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: const Color(0xff929292)),
                  ),
                ],
              ),
              textAlign: TextAlign.start,
            ),
            Flexible(
              flex: 4,
              child: Container(),
            ),
          ],
        ),
        const Spacer(),
        // buildColouredcard(300, 400),
        const Spacer(),
      ],
    );
  }
}

Widget buildColouredcard(double w, double h) {
  return Card(
    shadowColor: Colors.red,
    elevation: 8,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    clipBehavior: Clip.antiAlias,
    child: Container(
      width: w,
      height: h,
      decoration: const BoxDecoration(
        color: Colors.redAccent,
      ),
      padding: const EdgeInsets.all(16),
      child: const Text(
        'Coloured card',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

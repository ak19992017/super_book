import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController = PageController();
  int _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void forwardDotAnimationFunction() {
    _pageController.animateToPage(
      ++_pageIndex % demoData.length,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void backwardDotAnimationFunction() {
    _pageController.animateToPage(
      --_pageIndex % demoData.length,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    shape: const CircleBorder(),
    primary: Colors.redAccent,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _pageIndex = index;
                });
              },
              itemCount: demoData.length,
              itemBuilder: ((context, index) {
                return OnboardContent(
                  image: demoData[index].image,
                  title: demoData[index].title,
                  description: demoData[index].description,
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: backwardDotAnimationFunction,
                    style: buttonStyle,
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                const Spacer(),
                ...List.generate(
                  demoData.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: DotIndicator(isActive: index == _pageIndex),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: forwardDotAnimationFunction,
                    style: buttonStyle,
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 10 : 10,
      width: isActive ? 30 : 10,
      decoration: BoxDecoration(
          color: isActive ? Colors.redAccent : Colors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<Onboard> demoData = [
  Onboard(
    image: 'assets/images/Discovery.png',
    title: "Discovery",
    description: "Find the item you've \nbeen looking for",
  ),
  Onboard(
    image: 'assets/images/Tourists.png',
    title: "Tourists",
    description: "Vist places you have \nnever been before.",
  ),
  Onboard(
    image: 'assets/images/Lateness.png',
    title: "Lateness",
    description: "Vist places you have \nnever been before.",
  ),
  Onboard(
    image: 'assets/images/Explore.png',
    title: "Explore",
    description: "Vist places you have \nnever been before.",
  ),
  Onboard(
    image: 'assets/images/Floating.png',
    title: "Floating",
    description: "Vist places you have \nnever been before.",
  ),
  Onboard(
    image: 'assets/images/Journey.png',
    title: "Journey",
    description: "Vist places you have \nnever been before.",
  ),
  Onboard(
    image: 'assets/images/Landscape view.png',
    title: "Landscape view",
    description: "Vist places you have \nnever been before.",
  ),
  Onboard(
    image: 'assets/images/Luggage.png',
    title: "Luggage",
    description: "Vist places you have \nnever been before.",
  ),
  Onboard(
    image: 'assets/images/Map.png',
    title: "Map",
    description: "Vist places you have \nnever been before.",
  ),
  Onboard(
    image: 'assets/images/Tickets.png',
    title: "Tickets",
    description: "Vist places you have \nnever been before.",
  ),
  Onboard(
    image: 'assets/images/Train.png',
    title: "Train",
    description: "Vist places you have \nnever been before.",
  ),
  Onboard(
    image: 'assets/images/Vacation.png',
    title: "Vacation",
    description: "Vist places you have \nnever been before.",
  ),
  Onboard(
    image: 'assets/images/Van.png',
    title: "Van",
    description: "Vist places you have \nnever been before.",
  ),
  Onboard(
    image: 'assets/images/Waiting.png',
    title: "Waiting",
    description: "Vist places you have \nnever been before.",
  ),
  Onboard(
    image: 'assets/images/Window seat.png',
    title: "Window seat",
    description: "Vist places you have \nnever been before.",
  ),
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        AspectRatio(
          aspectRatio: 16 / 12,
          child: Image.asset(
            image,
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}

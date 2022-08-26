import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class VegyList extends StatefulWidget {
  const VegyList({Key? key}) : super(key: key);

  @override
  State<VegyList> createState() => _VegyListState();
}

class _VegyListState extends State<VegyList> {
  int selectedIndex = 0;

  List<IconData> outlineIconList = [
    EvaIcons.homeOutline,
    EvaIcons.heartOutline,
    EvaIcons.shoppingCartOutline,
    EvaIcons.personOutline,
  ];

  List<IconData> filledIconList = [
    EvaIcons.home,
    EvaIcons.heart,
    EvaIcons.shoppingCart,
    EvaIcons.person,
  ];

  List<String> items = [
    'Apple',
    'Banana',
    'Capsicum',
    'Orange',
    'Strawberry',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      bottomNavigationBar: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: 80,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...List.generate(
                outlineIconList.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.ease,
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: index == selectedIndex
                            ? const Color(0XFFfecd42).withOpacity(0.15)
                            : null,
                      ),
                      child: Icon(
                        index == selectedIndex
                            ? filledIconList[index]
                            : outlineIconList[index],
                        size: 30,
                        color: index == selectedIndex
                            ? const Color(0XFFfecd42)
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              clipBehavior: Clip.antiAlias,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 6,
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          "assets/images/${items[index % items.length].toLowerCase()}.png",
                          height: 100,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              items[index % items.length],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Fruit",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.grey.shade600),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "4 kg",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(EvaIcons.close),
                        SizedBox(height: 4),
                        Text(
                          "\$15.99",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: 8,
      ),
    );
  }
}

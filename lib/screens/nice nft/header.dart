import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SizedBox(
        width: double.infinity,
        height: 75,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Nice.',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 350,
              height: 50,
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Search...',
                  hintStyle: const TextStyle(color: Color(0xff929292)),
                  fillColor: const Color(0xff3a3b3c),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Color(0xff929292),
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
            ),
            const HeaderButton(text: 'Explore'),
            const HeaderButton(text: 'Collections'),
            const HeaderButton(text: 'Gallery'),
            const CryptoDropdown(),
            ElevatedButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.blueAccent[700], // Text Color
              ),
              child: const Text('Connect Wallet'),
            )
          ],
        ),
      ),
    );
  }
}

class CryptoDropdown extends StatefulWidget {
  const CryptoDropdown({
    Key? key,
  }) : super(key: key);

  @override
  State<CryptoDropdown> createState() => _CryptoDropdownState();
}

class _CryptoDropdownState extends State<CryptoDropdown> {
  String? cryptoCoinUnit = 'Bitcoin (BTC)';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 180,
      padding: const EdgeInsets.all(5),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: cryptoCoinUnit,
          hint: const Text('Crypto'),
          items: <String>[
            'Bitcoin (BTC)',
            'Ethereum (ETH)',
            'Solana (SOL)',
            'Dogecoin (DOGE)'
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              cryptoCoinUnit = newValue;
            });
          },
          icon: const Icon(EvaIcons.arrowIosDownward),
        ),
      ),
    );
  }
}

class HeaderButton extends StatefulWidget {
  final String text;

  const HeaderButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<HeaderButton> createState() => _HeaderButtonState();
}

class _HeaderButtonState extends State<HeaderButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onHover: (value) => setState(() => isHovered = value),
      style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
          backgroundColor: MaterialStateProperty.all(
              !isHovered ? Colors.transparent : Colors.grey[700])),
      onPressed: () {},
      child: Text(
        widget.text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

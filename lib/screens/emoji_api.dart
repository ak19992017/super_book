// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String jsonString =
    "https://emoji-api.com/emojis?access_key=9ea980e06e66072044897fd16674cccf697c3365";
Future<List<Emoji>> fetchASingleEmoji() async {
  final response = await http.get(Uri.parse(jsonString));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    // print("response -> ${response.body}");
    return (jsonDecode(response.body) as List)
        .map((emoji) => Emoji.fromJson(emoji))
        .toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load emoji');
  }
}

class Emoji {
  final String slug;
  final String character;
  final String unicodeName;
  final String codePoint;
  final String group;
  final String subGroup;

  const Emoji({
    required this.slug,
    required this.character,
    required this.unicodeName,
    required this.codePoint,
    required this.group,
    required this.subGroup,
  });

  factory Emoji.fromJson(Map<String, dynamic> json) {
    return Emoji(
      slug: json['slug'],
      character: json['character'],
      unicodeName: json['unicodeName'],
      codePoint: json['codePoint'],
      group: json['group'],
      subGroup: json['subGroup'],
    );
  }
}

class MyEmoji extends StatefulWidget {
  const MyEmoji({super.key});

  @override
  State<MyEmoji> createState() => _MyEmojiState();
}

class _MyEmojiState extends State<MyEmoji> {
  late Future<List<Emoji>> futureEmoji;
  late int length;
  @override
  void initState() {
    super.initState();
    futureEmoji = fetchASingleEmoji();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      home: Scaffold(
        appBar: AppBar(title: const Text('Emoji API Demo')),
        body: Center(
          child: FutureBuilder<List<Emoji>>(
            future: futureEmoji,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data.runtimeType);
                print(snapshot.data!.length);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6),
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      return SelectableText(
                        snapshot.data![index].character,
                        style: const TextStyle(fontSize: 50),
                      );
                    }),
                  ),
                );
              } else if (snapshot.hasError) {
                return SelectableText('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

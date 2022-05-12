import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stream Controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Stream Controller'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int counter = 0;
  // This is For Single Stream Controller
  StreamController<int> streamController = StreamController<int>();

  // This is for Multiple Stream Controller
  late Stream multiStream;

  @override
  void initState() {
    super.initState();
    multiStream = streamController.stream.asBroadcastStream();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // For Return Steam Builder
              StreamBuilder(
                stream: multiStream,
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 100),
                    );
                  }
                  return const Text(
                    "0",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 100),
                  );
                },
              ),  StreamBuilder(
                stream: multiStream,
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 100),
                    );
                  }
                  return const Text(
                    "0",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 100),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter++;
          // For Subscribe Stream
          streamController.sink.add(counter);
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

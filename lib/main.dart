import 'homepage.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecosystem App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Ecosystem App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          centerTitle: true,
        ),
        body: Center(
            child: Stack(children: <Widget>[
          BackgroundImage(
              img:
                  "https://media.nationalgeographic.org/assets/photos/000/258/25846.jpg"),
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Edusystem",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 61, 227, 66),
                          fontWeight: FontWeight.bold,
                          fontSize: 100)),
                  SizedBox(height: 20),
                  EcosystemButton(),
                  SizedBox(height: 20),
                  HelpButton(),
                  SizedBox(height: 20),
                  CurrentEventsButton(),
                  SizedBox(height: 20),
                  AcknowledgementsButton()
                ]),
          )
        ])));
  }
}

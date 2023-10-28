import 'package:flutter/material.dart';
import 'coastalscrub.dart';
import 'homepage.dart';
import 'oakwoodlands.dart';
import 'sanddunes.dart';

class TableOfContents extends StatelessWidget {
  const TableOfContents({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('List of Ecosystems'),
              leading: Builder(
                builder: (BuildContext context2) {
                  return IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      tooltip: "Back");
                },
              ),
            ),
            body: Center(
                child: Stack(children: <Widget>[
              BackgroundImage(
                  img: "https://blog.hubspot.com/hubfs/tech-ecosystem.jpg"),
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("List of Ecosystems",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 61, 227, 66),
                              fontWeight: FontWeight.bold,
                              fontSize: 100)),
                      SizedBox(height: 20),
                      CoastalScrubButton(),
                      SizedBox(height: 20),
                      OakWoodlandsButton(),
                      SizedBox(height: 20),
                      SandDunesButton()
                    ]),
              )
            ]))));
  }
}

class CoastalScrubButton extends StatelessWidget {
  const CoastalScrubButton({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered))
                  return Colors.blue.withOpacity(0.04);
                if (states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.pressed))
                  return Colors.blue.withOpacity(0.12);
                return null;
              })),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CoastalScrub()));
          },
          child: Text("Coastal Scrub",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
        ));
  }
}

class OakWoodlandsButton extends StatelessWidget {
  const OakWoodlandsButton({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered))
                  return Colors.blue.withOpacity(0.04);
                if (states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.pressed))
                  return Colors.blue.withOpacity(0.12);
                return null;
              })),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const OakWoodlands()));
          },
          child: Text("Oak Woodlands Ecosystem",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
        ));
  }
}

class SandDunesButton extends StatelessWidget {
  const SandDunesButton({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered))
                  return Colors.blue.withOpacity(0.04);
                if (states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.pressed))
                  return Colors.blue.withOpacity(0.12);
                return null;
              })),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SandDunes()));
          },
          child: Text("Sand Dunes",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
        ));
  }
}

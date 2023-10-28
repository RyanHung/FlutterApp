import 'package:test/acknowledgements.dart';

import 'howtohelp.dart';

import 'package:flutter/material.dart';
import 'tableofcontents.dart';
import 'currentevents.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key, this.img = ""}) : super(key: key);
  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover)),
    );
  }
}

class HelpButton extends StatelessWidget {
  const HelpButton({Key? key}) : super(key: key);
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HowToHelp()));
          },
          child: Text("How Can I Help?",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
        ));
  }
}

class EcosystemButton extends StatelessWidget {
  const EcosystemButton({Key? key}) : super(key: key);
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TableOfContents()));
          },
          child: Text("Explore",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
        ));
  }
}

class AcknowledgementsButton extends StatelessWidget {
  const AcknowledgementsButton({Key? key}) : super(key: key);
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Acknowledgements()));
          },
          child: Text("Credits & Acknowledgement",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        ));
  }
}

class CurrentEventsButton extends StatelessWidget {
  const CurrentEventsButton({Key? key}) : super(key: key);
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
                MaterialPageRoute(builder: (context) => const CurrentEvents()));
          },
          child: Text("Current Events",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        ));
  }
}

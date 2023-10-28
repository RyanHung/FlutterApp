import 'main.dart';
import 'homepage.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HowToHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text("How To Help"),
        ),
        body: Container(
            height: 900,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://wallpaperaccess.com/full/952271.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: const [
                DefaultTextStyle(
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                    child: Text("Donations")),
                Text(
                  'Donations are the simplest way anyone can help, by funding the operation to help preserve the ecosystem, you can make a difference. Rainforest Partnership is an example of a place where your donations would go to preserving the rainforests of the planet.\n',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.white, shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(0, 0),
                        blurRadius: 5)
                  ]),
                ),
                ClickingButton(
                    title: "Click here to donate, every dollar counts",
                    link:
                        "https://www.rainforestpartnership.org/?gclid=CjwKCAjw9e6SBhB2EiwA5myr9lAI-hpJfhi-PnJFfTrf6dgwhocWD5HkhtcMD3rRKgoHjQvfbo3C7RoCKL4QAvD_BwE"),
                DefaultTextStyle(
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                    child: Text("\nActivism")),
                Text(
                  'Since most of the environmental damage is mainly caused by burning of fossil fuels, the damage can only be stopped through political means and lawful enforcement to reduce or eliminate the sources of C02 emissions. By taking initiative, you can help promote policies and acts will enforce change in order to reduce the effects of climate change. If all else fails, plant a tree! Planting a tree would lower your carbon footprint and would leave a lasting impact on the planet.\n',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.white, shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(0, 0),
                        blurRadius: 5)
                  ]),
                ),
                SizedBox(
                  height: 75,
                  width: 1000,
                  child: ClickingButton(
                      title:
                          "Click here to visit Acterra, an organization focused on combatting climate change",
                      link: "https://www.acterra.org/take-action"),
                )
              ],
            )));
  }
}

class ClickingButton extends StatelessWidget {
  const ClickingButton({Key? key, required this.title, required this.link})
      : super(key: key);

  final String title;
  final String link;

  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        height: 80,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 4, 191, 10)),
          onPressed: _launchURL,
          child: Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black)),
        ));
  }

  _launchURL() async {
    String url = link;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("yes");
      throw 'Could not launch $url';
    }
  }
}

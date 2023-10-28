import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CurrentEvents extends StatelessWidget {
  const CurrentEvents({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text("Current Events"),
        ),
        body: Container(
            height: 900,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://media-cldnry.s-nbcnews.com/image/upload/newscms/2020_30/3398550/200721-polar-bears-mc-944.JPG"),
                  fit: BoxFit.cover),
            ),
            child: Column(children: [
              const DefaultTextStyle(
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.black),
                child: Text(
                    "\nArticles on current updates related to climate change\n"),
              ),
              InkWell(
                  child: const Text(
                      "Warming seas may fundamentally shift marine ecosystems",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color.fromARGB(255, 4, 41, 134))),
                  onTap: () {
                    launch(
                        'https://www.silive.com/news/2022/04/warming-seas-may-fundamentally-shift-marine-ecosystems-says-study.html');
                  }),
              const Text(
                  "The article goes into the effects of rising global temperatures on the river ecosystem and how the food chain as a result has been deeply effected. It goes on to lamanent the effects for all marine life with the effects of global warming and climate change.\n",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              InkWell(
                  child: const Text(
                      "Stopping Climate Change is doable but Time is Short",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color.fromARGB(255, 4, 41, 134))),
                  onTap: () {
                    launch(
                        'https://www.nytimes.com/2022/04/04/climate/climate-change-ipcc-un.html');
                  }),
              const Text(
                  "The New York Times article goes into the action that the UN needs to take in order to help stop climate change before it is too late. The articles describes the lasting causes and the ways the governments can prevent this, along with the limitations that may also exist with the solutions presented.\n",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              InkWell(
                  child: const Text(
                      "Joshua trees, threatened by climate change, deserve California’s protection",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color.fromARGB(255, 4, 41, 134))),
                  onTap: () {
                    launch(
                        'https://www.latimes.com/opinion/story/2022-04-17/joshua-trees-threatened-climate-change');
                  }),
              const Text(
                  "An editoral from the Los Angeles Times depicts the truth about the California wildlife in the area and the many different ways in which people can help preserve the wildlife. The article also describes the required action that the govnerment needs to partake in to help save the tree intrinsic to California\n",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ])));
  }
}

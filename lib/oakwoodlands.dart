import 'homepage.dart';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OakWoodlands extends StatelessWidget {
  const OakWoodlands({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('Oak Woodlands'),
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
                  img:
                      "https://www.sierraforestlegacy.org/images/conservation/FireForestEcology/OakWoodland.jpg"),
              OakWoodlandWidget()
            ]))));
  }
}

class OakWoodlandWidget extends StatefulWidget {
  const OakWoodlandWidget({Key? key}) : super(key: key);
  @override
  State<OakWoodlandWidget> createState() => _OakWoodlandState();
}

class _OakWoodlandState extends State<OakWoodlandWidget> {
  late PageController _pageController;

  List<String> images = [
    "https://www.sierraforestlegacy.org/images/conservation/FireForestEcology/OakWoodland.jpg",
    "https://media.defense.gov/2018/Jul/25/2001946804/-1/-1/0/120417-F-RU983-0060.JPG",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSr3XUn3EtZy4tk9gXKM79qnvFJT2tiGB2R6Q&usqp=CAU",
    "https://oaks.cnr.berkeley.edu/wp-content/uploads/2019/03/California-Quail-Lee-Karney-USFWS-1024x683.jpg",
    "https://i.natgeofe.com/k/b71dca4f-c9a9-484c-a178-39e731069cd2/bobcat-portrait_4x3.jpg"
  ];
  List<String> captions = [
    "The oak woodlands are a particulately unique ecosystem in that almost half of the state's vertebrate animals reside there. The presence of large amounts of vegetation and its close proximity to higher elevation runoff lead to its importance in water quality protection. However, urban and agricultural development has led to a reduction in the size of the ecosystem in California.",
    "The California ground squirrel, or Beechey's ground squirrel named after a European explorer, is a small mammal that has grayish brown fur. They primarily eat seeds including oats and acorns as well as insects, fruit, and eggs. They utilize cheek pouches in order to store food and store food for future use. They shelter on the ground and in burrow systems.",
    "The black oak is a relatively small tree that contains leaves that contain a gradient of green to yellowish-brown colors. Its fruit is an acorn that ripen during the fall. The acorn is covered with a scaley exterior and can occur in clusters. It requires an intermediate amount of light in order to survive and reproduce.",
    "The California quail is a bird that eats mostly seeds and leaves. They prefer to nest in clumps of grass or brush/woodpiles. In order to hide and rest, they utilize areas of thick shrubs. The quails also sleep in trees at night for safety due to dangers from feral and house cats.",
    "Bobcats, fierce predators of the north, are extremely fast and adept at swimming. They can run at up to speeds of 25-30 miles an hour and jump as far as 12 feet. They can also use their whiskers as extra appendages in order to feel around."
  ];
  int activePage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: PageView.builder(
              itemCount: images.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return slider(captions, images, pagePosition, active);
              }),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(images.length, activePage)),
        Padding(
            padding: EdgeInsets.all(16.0),
            child: (Text(captions[activePage],
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          offset: Offset(5, 5),
                          blurRadius: 5)
                    ]))))
      ],
    );
  }
}

AnimatedContainer slider(captions, images, pagePosition, active) {
  double margin = active ? 10 : 20;

  return AnimatedContainer(
    duration: Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(images[pagePosition]))),
  );
}

imageAnimation(PageController animation, images, pagePosition) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, widget) {
      print(pagePosition);

      return SizedBox(
        width: 500,
        height: 500,
        child: widget,
      );
    },
    child: Container(
      margin: EdgeInsets.all(10),
      child: Image.network(images[pagePosition]),
    ),
  );
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: currentIndex == index ? Colors.black : Colors.white,
        shape: BoxShape.circle,
      ),
    );
  });
}

SliderPlugin(images) {
  return CarouselSlider(
    options: CarouselOptions(
      height: 200.0,
      enlargeCenterPage: true,
      onPageChanged: (position, reason) {
        print(reason);
        print(CarouselPageChangedReason.controller);
      },
      enableInfiniteScroll: false,
    ),
    items: images.map<Widget>((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(i))));
        },
      );
    }).toList(),
  );
}

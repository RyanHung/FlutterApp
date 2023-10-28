import 'homepage.dart';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CoastalScrub extends StatelessWidget {
  const CoastalScrub({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('Coastal Scrub'),
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
                      "https://i.pinimg.com/originals/a4/67/34/a46734d6db706a76b61f43c2affb31c2.jpg"),
              CoastalScrubWidget()
            ]))));
  }
}

class CoastalScrubWidget extends StatefulWidget {
  const CoastalScrubWidget({Key? key}) : super(key: key);
  @override
  State<CoastalScrubWidget> createState() => _CoastalScrubState();
}

class _CoastalScrubState extends State<CoastalScrubWidget> {
  late PageController _pageController;

  List<String> images = [
    "https://i.pinimg.com/originals/a4/67/34/a46734d6db706a76b61f43c2affb31c2.jpg",
    "https://calscape.com/ExtData/allimages/Photos/Artemisia_californica_image13.jpg",
    "https://www.gannett-cdn.com/presto/2022/03/31/PRRS/4801d4f6-a443-476a-bb20-484f95627f93-CDFW_rattlesnake.jpg",
    "https://www.allaboutbirds.org/guide/assets/photo/308526311-480px.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgFXsUIgUfqeFLwWz1GYxPntDuazd6V-v0DQ&usqp=CAU"
  ];
  List<String> captions = [
    "A biological community of plants and animals along California's coastline, the coastal scrub is a unique ecosystem that shelters many unique organisms, including California sage, rattlesnakes, and the California gnatcatcher. However, it is also one of the most endangered ecosystems in the Californian region due to rapid urban development reducing the ecosystem to 10-30% of its original size.",
    "The California sagebrush is an aromatic shrub that grows in dry foothill communities. The plant consists of a base and branches that round out from it. The stems are slender and flexible, with light green leaves and flower clusters. The plant is able to tolerate the dryness of the coastal scrub and is extremely resistant to exposure.",
    "Rattlesnakes are venomous snakes that are most well known for their telltale \"rattle\", which is commonly misunderstood as a sign of aggression. In reality, these shy creatures are nonthreatening and will retreat if given the opportunity. They generally hide in secluded areas during the winter, but may come to bask out during the warmer months.",
    "California Gnatcatchers are tiny gray birds that frequent dry scrubs in Southern California. They are characterized by their small stature and thin, long black tail. One fun fact is that they clean themselves using water collected from rain or fog. Unfortunately, due to the loss of scrub habitat, the California subspecies is on the Endangered Species list.",
    "Laurel Sumac, or Malosma, is an evergreen plant that has a pungent, green odor. Its leaves are 3-5 inches across, often with colors of white, pink, and green. The flowers are clustered together in multi-branched clusters that resemble pyramids. They are most commonly found as isolated shrubs or small trees in the coastal sage scrub."
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

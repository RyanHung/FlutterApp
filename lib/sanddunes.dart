import 'homepage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SandDunes extends StatelessWidget {
  const SandDunes({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('Sand Dunes'),
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
                      "https://i.natgeofe.com/n/d7db3d90-f856-4e7e-a95c-fa082d5ff738/tottori-sand-dunes-japan-2_2x1.jpg"),
              SandDuneWidget()
            ]))));
  }
}

class SandDuneWidget extends StatefulWidget {
  const SandDuneWidget({Key? key}) : super(key: key);
  @override
  State<SandDuneWidget> createState() => _SandDuneState();
}

class _SandDuneState extends State<SandDuneWidget> {
  late PageController _pageController;
  List<String> images = [
    "https://i.natgeofe.com/n/d7db3d90-f856-4e7e-a95c-fa082d5ff738/tottori-sand-dunes-japan-2_2x1.jpg",
    "https://www.nps.gov/grsa/learn/nature/images/dunes_tiger_salamander_bury.jpg?maxwidth=650&autorotate=false&quality=78&format=webp",
    "https://calscape.com/species_images/calphotos/images500/0000_0000_0605_0590.jpeg",
    "https://www.desertmuseum.org/kids/oz/long-fact-sheets/tarantula%20copy.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Cerastes_cerastes_1.jpg/220px-Cerastes_cerastes_1.jpg"
  ];
  List<String> captions = [
    "The desert dunes is a hot and dry environment that holds some of the hottest places in the world, among which some are Sahara Desert and Death Valley. Yet despite the miserable conditions for humans, it holds a variety of wildlife and organisms that thrive in an ecosystem void of human civilization. Most plants and animals have to survive off miminal food and water, being very conservative with their consumption.",
    "Tiger salamanders are a very adaptive species, they are known to survive in many different extreme environments. The salamanders often bury themselves in the moist sand. Combined with their brown colored scales, they are able to hide very well in the sands and avoid predators. They can grow up to 8 inches long, making them one of the largest salamanders in North America.",
    "The Oenothera primiveris, also known as the yellow desert evening primrose, is herbal flower that is commonly found in Southwestern United States and Mexico. The yellow flower is named for its feature of blooming during the night contrary to most other plants. The flower often blooms during the winter season and fades to orange over time.",
    "Tarantulas are a common part of the desert wildlife that typically reside in North American deserts. There are many different variations of the spiders in size and color. While being the predators for many insects and small mammals that may exist in the desert, they are also preyed by the tarantula hawk, a wasp species that is also common to the area.",
    "Horned Vipers are a small group of vipers that like in Sahara desert and parts of Iran and Arabia. They are venomous creatures that only average a length of 20 inches, making them very easy to miss especially with their camouflage. Their most distinct feature is the two horns on top of their eyes which is subject for scientific speculation to their purpose. "
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

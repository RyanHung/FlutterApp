import 'package:flutter/material.dart';

class Acknowledgements extends StatelessWidget {
  const Acknowledgements({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text("Credits and Acknowledgement"),
        ),
        body: Container(
            height: 900,
            width: double.infinity,
            decoration: const BoxDecoration(
                /*image: DecorationImage(
                  image: NetworkImage(
                      "https://media.proprofs.com/images/QM/user_images/1452023/1430982767.jpg"),
                  fit: BoxFit.cover),
            */
                ),
            child: Column(children: [
              Text(
                'Created by Ryan Hung and Aditya Mishra\n',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, color: Colors.black),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ' Bay Area Ecosystems found at: https://sfenvironment.org/ecosystems/overview/ecosystems\n Background pictures:\n    https://blog.hubspot.com/website/technology-ecosystem\n    https://images.pexels.com/photos/957024/forest-trees-perspective-bright-957024.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2\n    https://media.nationalgeographic.org/assets/photos/000/258/25846.jpg\n Coastal Scrubland:\n    https://www.pinterest.com/pin/166492517447196528/\n    https://ocde.us/ito/Documents/CoastalSageScrubEcosystem.pdf\n California Sage:\n    https://calscape.org/Artemisia-californica-()\n Rattlesnakes:\n    https://www.redding.com/story/news/2022/04/05/california-rattlesnakes-how-avoid-respect-eat-snake/7231762001/\n California Gnatcatcher:\n    https://www.allaboutbirds.org/guide/California_Gnatcatcher/overview\n Laurel Sumac:\n    http://www.calflora.net/bloomingplants/laurelsumac.html\n    https://thenaturecollective.org/plant-guide/details/laurel-sumac/\n ',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )),
              SizedBox(
                  width: 400,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
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
                              builder: (context) => const Acknowledgements2()));
                    },
                    child: Text("Next",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ))
            ])));
  }
}

class Acknowledgements2 extends StatelessWidget {
  const Acknowledgements2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text("Credits and Acknowledgement 2"),
        ),
        body: Container(
            height: 900,
            width: double.infinity,
            decoration: const BoxDecoration(
                /*image: DecorationImage(
                  image: NetworkImage(
                      "https://media.proprofs.com/images/QM/user_images/1452023/1430982767.jpg"),
                  fit: BoxFit.cover),
            */
                ),
            child: Column(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Oak Woodlands:\n    https://www.sierraforestlegacy.org/images/conservation/FireForestEcology/OakWoodland.jpg\n    https://wrangle.org/ecotype/north-american-oak-woodlands\n Ground Squirrel:\n    https://media.defense.gov/2018/Jul/25/2001946804/-1/-1/0/120417-F-RU983-0060.JPG\n    http://naturemappingfoundation.org/natmap/facts/california_ground_squirrel_712.html\n Black Oak:\n    https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSr3XUn3EtZy4tk9gXKM79qnvFJT2tiGB2R6Q&usqp=CAU\n    https://en.wikipedia.org/wiki/Quercus_velutina\n Quail:\n    https://oaks.cnr.berkeley.edu/wildlife/\n    https://www.laspilitas.com/California_birds/Quail/California_Quail_in_your_garden.htm\n Bobcat:\n    https://kids.nationalgeographic.com/animals/mammals/facts/bobcat\n Sand Dunes:\n    https://i.natgeofe.com/n/d7db3d90-f856-4e7e-a95c-fa082d5ff738/tottori-sand-dunes-japan-2_2x1.jpg\n    https://www.nps.gov/grsa/learn/nature/animals.htm\n Tiger Salamander:\n    https://www.nps.gov/grsa/learn/nature/images/dunes_tiger_salamander_bury.jpg?maxwidth=650&autorotate=false&quality=78&format=webp\n Yellow Desert Evening Primrose:\n    https://calscape.com/species_images/calphotos/images500/0000_0000_0605_0590.jpeg\n Tarantulas:\n    https://www.desertmuseum.org/kids/oz/long-fact-sheets/tarantula%20copy.jpg\n Horned Viper:\n    https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Cerastes_cerastes_1.jpg/220px-Cerastes_cerastes_1.jpg',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )),
            ])));
  }
}

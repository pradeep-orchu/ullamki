import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FlatScreen extends StatefulWidget {
  const FlatScreen({super.key});

  @override
  State<FlatScreen> createState() => _FlatScreenState();
}

class _FlatScreenState extends State<FlatScreen> {
  final PageController pageController = PageController();
  final MapController mapController = MapController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flat'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: PageView(
                controller: pageController,
                children: [
                  AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Container(
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.primaryContainer),
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Container(
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer),
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Container(
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pradeep Krishna',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text('Owner')
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '3000',
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'jfdjskjkasjdfkjskladfjkljasdklfjklasjfdkljsadlkfjklasjdfkljsaldkfjklsdjfkljasdlfkjalksjfdafksdjkasjfdkljsalkdfjlkasdjfkljsadflkjdlfkjsalkjdf;lksjdf.;asl;dfj;lkasdjfljasfkdljslfdc',
                    maxLines: 10,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: SizedBox(
                      height: 200,
                      child: FlutterMap(
                        mapController: mapController,
                        options: MapOptions(
                            center: LatLng(51.509364, -0.128928),
                            zoom: 9.2,
                            interactiveFlags: InteractiveFlag.pinchZoom |
                                InteractiveFlag.doubleTapZoom),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'com.example.app',
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      )),
    );
  }
}

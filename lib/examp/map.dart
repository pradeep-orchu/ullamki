import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart' as loc;

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // @override
  // void initState() {
  //   super.initState();
  //   getloc();
  // }

  loc.LocationData? _locationData;
  String? cityname;
  String? cities;

  Future<void> getloc() async {
    loc.Location location = new loc.Location();

    bool _serviceEnabled;
    loc.PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == loc.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    print(_locationData);
    double? latitude = _locationData!.latitude;
    double? longitude = _locationData!.longitude;
    print(latitude);
    print(longitude);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude!, longitude!);
    if (placemarks.isNotEmpty) {
      String? citie = placemarks[1].locality;
      String? city = placemarks[0].locality;
      print(city);
      setState(() {
        cityname = city;
      });
      setState(() {
        cities = citie;
      });
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Map'),
          centerTitle: true,
        ),
        body: cityname == null
            ? CircularProgressIndicator()
            : Column(
                children: [
                  Text(cityname.toString()),
                  Text(cities.toString()),
                ],
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: getloc,
        ));
  }
}

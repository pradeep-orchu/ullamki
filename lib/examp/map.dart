import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart' as loc;

class MapScreenEx extends StatefulWidget {
  MapScreenEx({super.key});
  @override
  _MapScreenExState createState() => _MapScreenExState();
}

class _MapScreenExState extends State<MapScreenEx> {
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
      String? city = placemarks[1].locality;
      print(city);
      print(placemarks);
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
        title: cityname == null ? Text('Map') : Text(cityname!),
        centerTitle: true,
      ),
      body: FlutterMap(
        options: MapOptions(
          center: _locationData == null
              ? LatLng(16.6894559, 81.1229128)
              : LatLng(_locationData!.latitude!, _locationData!.longitude!),
          zoom: 15,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          // RichAttributionWidget(
          //   attributions: [
          //     // TextSourceAttribution(
          //     //   'OpenStreetMap contributors',
          //     //   onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
          //     // ),
          //   ],
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: getloc),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;

enum LocationStatus {
  uninitialized,
  authenticated,
  unauthenticated,
}

class LocationService extends ChangeNotifier {
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
    double? latitude = _locationData!.latitude;
    double? longitude = _locationData!.longitude;
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude!, longitude!);
    if (placemarks.isNotEmpty) {
      String? citie = placemarks[1].locality;
      String? city = placemarks[1].locality;
      cityname = city;
      cities = citie;
    } else {
      return;
    }
  }
}

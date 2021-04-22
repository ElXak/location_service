import 'dart:async';

import 'package:location/location.dart';

import '../data_models/user_location.dart';

class LocationService {
  // Keep track of current location
  UserLocation _currentLocation;

  Location location = Location();

  // Continuously emit location updates
  StreamController<UserLocation> _locationController =
      StreamController<UserLocation>.broadcast();

  LocationService() {
    location.requestPermission().then((permissionStatus) => {
          if (permissionStatus == PermissionStatus.granted)
            {
              location.onLocationChanged.listen((locationData) {
                if (locationData != null) {
                  _locationController.add(UserLocation(
                    latitude: locationData.latitude,
                    longitude: locationData.longitude,
                  ));
                }
              })
            }
        });
  }

  Stream<UserLocation> get locationStream => _locationController.stream;

  Future<UserLocation> getLocation() async {
    try {
      LocationData userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
    } catch (e) {
      print('Could not get the location: $e');
    }

    return _currentLocation;
  }
}
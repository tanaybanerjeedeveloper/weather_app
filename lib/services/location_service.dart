import 'package:geolocator/geolocator.dart';

class LocationService {
  double latitude;
  double longitude;
  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        print('Permissions not given');
        LocationPermission asked = await Geolocator.requestPermission();
      } else {
        Position currentPosition = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        latitude = currentPosition.latitude;
        longitude = currentPosition.longitude;
      }
    } catch (e) {
      print('error is $e');
    }
  }
}

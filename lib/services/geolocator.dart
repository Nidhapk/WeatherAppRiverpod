import 'package:geolocator/geolocator.dart';

Future<String> geolocation() async {
  LocationPermission permission;
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permission are denied');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied.we can not request permissions');
  }
  Position position = await Geolocator.getCurrentPosition();
  // Return the latitude and longitude as a string in the required format
  return "${position.latitude},${position.longitude}";
}

import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position?> getCurrentPoint() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print('Location services are disabled.');
        return null;
      }

      // permission = await Geolocator.checkPermission();
      permission = await Geolocator.checkPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
        return null;
      }

      if (permission == LocationPermission.deniedForever) {
        print(
            'Location permissions are permanently denied, we cannot request permissions.');
        return null;
      }
      Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      print(pos.toJson());
      return pos;
    } catch (e) {
      print("Geolocator getCurrentPosition Error: $e");
    }

    return null;
  }
}

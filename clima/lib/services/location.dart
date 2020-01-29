import 'package:geolocator/geolocator.dart';

class Location {
  double longtitude;

  double latitude;
  Future<void> getCurrentPosition() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      this.latitude = position.latitude;
      this.longtitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}

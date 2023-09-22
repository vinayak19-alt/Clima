import 'package:geolocator/geolocator.dart';

class Location{
  late double longitude;
  late double latitude;

  Future<void> getCurrentLocation() async {
    try{
        Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
        latitude=position.latitude;
        longitude=position.longitude;
    }
    catch(e){
      print(e);
    }
  }
  Future<void> getRequestPermission() async {
    try{
      LocationPermission permission = await Geolocator.requestPermission();
    }
    catch(e){
      print(e);
    }
  }
}
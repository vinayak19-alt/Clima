import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    super.initState();
    getLocationData();
    requestPermission();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    getData();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(
        locationWeather : weatherData,
      );
    }));
  }

  void requestPermission() async {
    Location request = Location();
    await request.getRequestPermission();
  }

  void getData() async {
    Response response = await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=9e5af667a2511b0bb1cdc5f7c16d5d50'));
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}

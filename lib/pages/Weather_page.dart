import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/models/Weather_model.dart';
import 'package:weather/services/weather_services.dart';
import 'package:weather/widget/TextItem.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService =
      WeatherService(apiKey: '96aaf16f32ee580c5f6616815a240437');
  Weather? _weather;

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/loading.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloudy.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/rainy.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextItem(
              text: _weather?.cityName ?? "Loading city...",
              size: 40,
            ),
            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
            TextItem(
                text: '${_weather?.temperature.round() ?? "...."}°C', size: 80),
            TextItem(
              text: _weather?.mainCondition ?? '',
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}

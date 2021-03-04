import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'cfc218e2ef85ed6860ba941c26b12c75';
const openWeatherMapURL = 'http://api.openweathermap.org/data/2.5/weather';
const openForecastURL = 'https://api.openweathermap.org/data/2.5/onecall';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityForecast(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openForecastURL?q=$cityName&appid=$apiKey&units=metric');
    var forecastData = await networkHelper.getData();
    return forecastData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationForecast() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openForecastURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var forecastData = await networkHelper.getData();
    return forecastData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

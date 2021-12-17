import './location_service.dart';
import './networking_service.dart';

const apiKey = '4ceb029340e11d9abb0554e5d07f276a';

class WeatherService {
  double latitude;
  double longitude;

  Future<dynamic> getCityWeather(String cityName) {
    NetworkingService networkingService = NetworkingService(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');
    var result = networkingService.getWeatherData();
    return result;
  }

  Future<dynamic> getLocationWeather() async {
    //fetching the current location
    LocationService locationService = LocationService();
    await locationService.getCurrentLocation();
    latitude = locationService.latitude;
    longitude = locationService.longitude;
    print(latitude);
    print(longitude);

    // sending http request
    NetworkingService networkingService = NetworkingService(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    var result = await networkingService.getWeatherData();
    return result;
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

  String getMessage(double temp) {
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

// ignore: depend_on_referenced_packages
import 'package:global_fitness/data/weather.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  //https://api.openweathermap.org/data/2.5/weather?q=london&appid=bb6c5c35db12e8ee2f51983f6eae9d59

  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = 'bb6c5c35db12e8ee2f51983f6eae9d59';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);

    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);
    return weather;
  }
}

import 'dart:io';

import 'weather_api_client.dart';

Future<void> main(List<String> arguments) async {
  if (arguments.length != 1) {
    print('Syntax: dart bin/main.dart <city>');
    exit(1);
  }
  final city = arguments.first;
  final api = WeatherApiClient();
  try {
    final weather = await api.getWeather(city);
    print(weather);
  } on WeatherApiException catch (e) {
    print(e.message);
  } on SocketException catch (_) {
    print('Could not fetch data. Check your internet connection.');
  } catch (e) {
    print(e);
  }
}

import 'dart:convert';
import 'dart:developer';
import 'package:weather_app/model/hourly_model.dart';
import 'package:weather_app/model/current_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weekly_model.dart';

class ApiServices {
  var apiKey = "d05b91ee97aefe1782851b9c328bcaa8";
  String baseUrl =
      "http://api.weatherstack.com/current?access_key=d05b91ee97aefe1782851b9c328bcaa8";

  Future<CurrentWeather?> fetchCurrentWeather(String city) async {
    final url = "$baseUrl&query=$city";
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        log("Success: Data fetched for $city.");
        log('response:${response.body}');
        if (response.body.isNotEmpty) {
          final json = jsonDecode(response.body) as Map<String, dynamic>;
          if (json['success'] == false) {
          // Handle specific API error codes in the response body
          log("API Error: ${json['error']['info']}");
          return null; // or throw a custom exception if needed
        }
          return CurrentWeather.fromJson(jsonDecode(response.body));
        } else {
          return null;
        }
      }  else {
        // Handle server errors or invalid status codes
        log("Error: Failed to fetch data. Status code: ${response.statusCode}");
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      // Catch any error that happens during the HTTP request or JSON parsing
      log("Error occurred: $e");
      throw Exception('Error occurred while fetching weather data: $e');
    }
  }

  Future<HourlyWeather> fetchHourlyData(String city) async {
    final coordinates = city.split(',');
    final latitude = coordinates[0];
    final longitude = coordinates[1];
    final url =
        'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&hourly=temperature_2m,relative_humidity_2m,precipitation_probability,weather_code,surface_pressure,cloud_cover,visibility,wind_speed_10m&forecast_days=1';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        log("Success: Data fetched for $city.");
        log('response:${response.body}');
        return HourlyWeather.fromJson(jsonDecode(response.body));
      } else {
        log("Error: Failed to fetch data2. Status code: ${response.statusCode}");
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      log("Error occurred: $e");
      throw Exception('Error occurred 2 while fetching weather data: $e');
    }
  }

  Future<WeeklyWeather> fetchWeeklyData(String city) async {
    final coordinates = city.split(',');
    final latitude = coordinates[0];
    final longitude = coordinates[1];
    final url =
        'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&daily=weather_code,temperature_2m_max,temperature_2m_min,sunrise,sunset';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        log("Success: Data fetched for $city.");
        log('response:${response.body}');
        return WeeklyWeather.fromJson(jsonDecode(response.body));
      } else {
        log("Error: Failed to fetch data3. Status code: ${response.statusCode}");
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      log("Error occurred: $e");
      throw Exception('Error occurred 2 while fetching weather data: $e');
    }
  }
}

import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/model/hourly_model.dart';
import 'package:weather_app/model/current_model.dart';
import 'package:weather_app/model/weekly_model.dart';
import 'package:weather_app/services/api_services.dart';
import 'package:weather_app/services/geolocator.dart';

final currentWeatherProvider = FutureProvider<CurrentWeather?>((ref) async {
  final latlng = await geolocation();
  log('latlng:$latlng');
  return await ApiServices().fetchCurrentWeather(latlng);
});

final hourlyForcast = FutureProvider<HourlyWeather>((ref) async {
  final latlng = await geolocation();
  return await ApiServices().fetchHourlyData(latlng);
});
final weeklyForcast = FutureProvider<WeeklyWeather>((ref) async {
  final latlng = await geolocation();
  return await ApiServices().fetchWeeklyData(latlng);
});
final currentWeatherOfSearchedCity = FutureProvider.family<CurrentWeather?,String>((ref, city) async {
  return await ApiServices().fetchCurrentWeather(city);
});
final searchTriggeredProvider = StateProvider<bool>((ref) => false);
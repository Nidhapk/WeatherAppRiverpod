import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/home/widgets/day_details.dart';
import 'package:weather_app/methods/get_weathericon.dart';
import 'package:weather_app/model/weekly_model.dart';

Widget weeklyDetails(
    {required BuildContext context,
    required AsyncValue<WeeklyWeather> weeklyWeather,
    required String day,
    required String icon,
    required String temperature}) {
  return weeklyWeather.when(
    data: (data) {
      //
      return ListView.builder(
          itemCount: 7,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var maxTemperature = data.daily.temperature2MMax[index];
            var minTemperature = data.daily.temperature2MMin[index];
            final day = convertToDay(data.daily.time[index]);
            return dayDetails(
              minTemperature: minTemperature.toString(),
              maxTemperature: maxTemperature.toString(),
              context: context,
              day: day,
              icon: icon,
            );
          });
    },
    error: (error, stack) => Center(
      child: Text('Error: $error'),
    ),
    loading: () => const Center(
      child: CircularProgressIndicator(),
    ),
  );
}

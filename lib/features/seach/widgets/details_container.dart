import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/features/home/widgets/sub_details.dart';
import 'package:weather_app/model/current_model.dart';

Widget detailsContainer({required BuildContext context,required CurrentWeather currentWeather}) {
  final width = MediaQuery.of(context).size.width;
  return Container(
      padding: EdgeInsets.all(
        width * 0.02,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 71, 71, 80).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              subDetails(
                context: context,
                value: currentWeather.current.pressure.toString(),
                title: 'Pressure',
                icon: 'assets/gauge.png',
              ),
              subDetails(
                context: context,
                value: currentWeather.current.cloudcover.toString(),
                title: 'Cloud Cover',
                icon: 'assets/cloud.png',
              ),
              subDetails(
                context: context,
                value: currentWeather.current.humidity.toString(),
                title: 'Humidity',
                icon: 'assets/water-temperature.png',
              ),
            ],
          ),
          Row(
            children: [
              subDetails(
                  context: context,
                  value: currentWeather.current.visibility.toString(),
                  title: 'Visiblilty',
                  icon: 'assets/visibility.png'),
              subDetails(
                  context: context,
                  value: currentWeather.current.uvIndex.toString(),
                  title: 'UV',
                  icon: 'assets/sun.png'),
              subDetails(
                  context: context,
                  value: currentWeather.current.windSpeed.toString(),
                  title: 'Wind',
                  icon: 'assets/wind.png'),
            ],
          ),
        ],
      ));
}

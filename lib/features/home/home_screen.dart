import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/home/widgets/custom_divider.dart';
import 'package:weather_app/features/home/widgets/search_button.dart';
import 'package:weather_app/features/home/widgets/sub_details.dart';
import 'package:weather_app/features/home/widgets/weekly_details.dart';
import 'package:weather_app/methods/get_weathericon.dart';
import 'package:weather_app/model/widgets/frosted_glassbox.dart';
import 'package:weather_app/model/widgets/place.dart';
import 'package:weather_app/provider/providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final weatherAsyncValue = ref.watch(currentWeatherProvider);
    final hourlyWeather = ref.watch(hourlyForcast);
    final weeklyWeather = ref.watch(weeklyForcast);
    log('$weatherAsyncValue');
    return Scaffold(
      body: weatherAsyncValue.when(
        data: (currentWeather) {
          return ListView(
            padding: EdgeInsets.all(width * 0.1),
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  placeText(
                    context: context,
                    name: currentWeather!.location.name,
                    region: currentWeather.location.region,
                    country: currentWeather.location.country,
                  ),
                  searchButton(
                    context: context,
                    onTap: () {
                      Navigator.of(context).pushNamed('/seachScreen');
                    },
                  )
                ],
              ),
              FrostedGlassBox(
                theWidth: width * 0.8,
                theHeight: height * 0.2,
                weatherDiscription:
                    currentWeather.current.weatherDescriptions.join(', '),
                temperature: currentWeather.current.temperature,
                weatherIcon: getWeatherIcon(
                    weatherCode: currentWeather.current.weatherCode),
              ),
              Container(
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
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              hourlyWeather.when(
                data: (hourlyWeather) {
                  var temperatureList = hourlyWeather.hourly.temperature2M;
                  var timeList = hourlyWeather.hourly.time;

                  return SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: timeList.length,
                      itemBuilder: (context, index) {
                        String formattedTime = DateTime.parse(timeList[index])
                            .toLocal()
                            .toString()
                            .substring(11, 16);

                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            height: 100,
                            width: 64,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 71, 71, 80)
                                    .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Add proper weather icon logic
                                Image.asset('assets/11d.png',
                                    height: 30, width: 30),
                                Text(
                                  temperatureList.isNotEmpty
                                      ? '${temperatureList[index]}°'
                                      : '0°',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 233, 232, 232),
                                  ),
                                ),
                                Text(
                                  formattedTime,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Text(
                    error.toString(),
                  ),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              customDivider(),
               weeklyDetails(weeklyWeather: weeklyWeather,
                        context: context,
                        day: 'Friday',
                        icon: 'assets/11d.png',
                        temperature: '27'),
              SizedBox(
                height: height * 0.025,
              ),
              customDivider()
            ],
          );
        },
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

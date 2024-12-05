import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/home/widgets/weather_cnontainer_details.dart';
import 'package:weather_app/features/seach/widgets/custom_searchbar.dart';
import 'package:weather_app/features/seach/widgets/details_container.dart';
import 'package:weather_app/features/seach/widgets/searched_city.dart';
import 'package:weather_app/provider/providers.dart';

class SearchScreen extends ConsumerWidget {
  SearchScreen({
    super.key,
  });

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the current weather data provider
    // final currentWeather = ref.watch(currentWeatherOfSearchedCity(controller.text.trim()));
    final isSearchTriggered = ref.watch(searchTriggeredProvider);
    final currentWeather = isSearchTriggered
        ? ref.watch(currentWeatherOfSearchedCity(controller.text.trim()))
        : null;

    return Scaffold(
      body: ListView(
        children: [
          customsearchBar(context: context, controller: controller),
          ElevatedButton(
            onPressed: () {
              // Trigger the provider with the city name when the button is clicked
              ref.read(searchTriggeredProvider.notifier).state = true;
              ref.refresh(currentWeatherOfSearchedCity(controller.text.trim()));
            },
            child: Text('Search'),
          ),

          // Display the fetched weather data in the container
          isSearchTriggered && currentWeather != null
              ? currentWeather.when(
                  data: (weatherData) {
                    // Use the weather data in the container
                    if (weatherData == null) {
                    return  Center(
                        child: Text('No data'),
                      );
                    }else{
                      return Column(
                      children: [
                        searchedCityContainer(
                          context: context,
                          name: weatherData.location.name,
                          temperature:
                              weatherData.current.temperature.toString(),
                          region: weatherData.location.region,
                          country: weatherData.location.country,
                          weatherDiscription: weatherData
                              .current.weatherDescriptions
                              .toString(),
                          image:
                              'assets/weatherIcon.png', // Provide a proper image based on the weather condition
                        ),
                        detailsContainer(
                            context: context, currentWeather: weatherData)
                      ],
                    );
                    }
                    
                  },
                  error: (error, stack) => Center(child: Text('Error: $error')),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                )
              : isSearchTriggered && currentWeather == null
                  ? Center(
                      child: Text('No data found'),
                    )
                  : Center(
                      child: Text(
                        'Enter a city and press search,',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
        ],
      ),
    );
  }
}

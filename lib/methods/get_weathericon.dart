String getWeatherIcon({
  required int weatherCode,
}) {
  String weatherCondition = 'assets/01d.png';

  if (weatherCode == 801) {
    weatherCondition = 'assets/icons/02d.png';
  } else if (weatherCode == 802) {
    weatherCondition = 'assets/icons/03d.png';
  } else if (weatherCode == 803) {
    weatherCondition = 'assets/icons/04d.png';
  } else if (weatherCode == 804) {
    weatherCondition = 'assets/icons/04d.png';
  } else if (weatherCode == 800) {
    weatherCondition = 'assets/01d.png';
  } else if (weatherCode > 700) {
    weatherCondition = 'assets/icons/50d.png';
  } else if (weatherCode >= 600) {
    weatherCondition = 'assets/icons/13d.png';
  } else if (weatherCode >= 500) {
    weatherCondition = 'assets/icons/10d.png';
  } else if (weatherCode >= 300) {
    weatherCondition = 'assets/icons/09d.png';
  } else if (weatherCode >= 200) {
    weatherCondition = 'assets/icons/11d.png';
  } else if (weatherCode < 200) {
    weatherCondition = 'assets/13d.png';
  }

  return weatherCondition;
}

String convertToDay(DateTime dateString) {
  //DateTime dateTime = DateTime.parse(dateString);
  return dateString.weekday == 1
      ? 'Monday'
      : dateString.weekday == 2
          ? 'Tuesday'
          : dateString.weekday == 3
              ? 'Wednesday'
              : dateString.weekday == 4
                  ? 'Thursday'
                  : dateString.weekday == 5
                      ? 'Friday'
                      : dateString.weekday == 6
                          ? 'Saturday'
                          : 'Sunday';
}

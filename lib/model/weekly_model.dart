class WeeklyWeather {
  double latitude;
  double longitude;
  double generationtimeMs;
  dynamic utcOffsetSeconds;
  String timezone;
  String timezoneAbbreviation;
  dynamic elevation;
  DailyUnits dailyUnits;
  Daily daily;

  WeeklyWeather({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.dailyUnits,
    required this.daily,
  });

  factory WeeklyWeather.fromJson(Map<String, dynamic> json) {
    return WeeklyWeather(
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      generationtimeMs: json['generationtime_ms'].toDouble(),
      utcOffsetSeconds: json['utc_offset_seconds'],
      timezone: json['timezone'],
      timezoneAbbreviation: json['timezone_abbreviation'],
      elevation: json['elevation'],
      dailyUnits: DailyUnits.fromJson(json['daily_units']),
      daily: Daily.fromJson(json['daily']),
    );
  }
}

class Daily {
  List<DateTime> time;
  List<dynamic> weatherCode;
  List<dynamic> temperature2MMax;
  List<dynamic> temperature2MMin;
  List<String> sunrise;
  List<String> sunset;

  Daily({
    required this.time,
    required this.weatherCode,
    required this.temperature2MMax,
    required this.temperature2MMin,
    required this.sunrise,
    required this.sunset,
  });

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      time: List<String>.from(json['time']).map((date) => DateTime.parse(date)).toList(),
      weatherCode: List<dynamic>.from(json['weather_code']),
      temperature2MMax: List<dynamic>.from(json['temperature_2m_max']),
      temperature2MMin: List<dynamic>.from(json['temperature_2m_min']),
      sunrise: List<String>.from(json['sunrise']),
      sunset: List<String>.from(json['sunset']),
    );
  }
}

class DailyUnits {
  String time;
  String weatherCode;
  String temperature2MMax;
  String temperature2MMin;
  String sunrise;
  String sunset;

  DailyUnits({
    required this.time,
    required this.weatherCode,
    required this.temperature2MMax,
    required this.temperature2MMin,
    required this.sunrise,
    required this.sunset,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) {
    return DailyUnits(
      time: json['time'],
      weatherCode: json['weather_code'],
      temperature2MMax: json['temperature_2m_max'],
      temperature2MMin: json['temperature_2m_min'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}

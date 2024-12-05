class HourlyWeather {
  double latitude;
  double longitude;
  double generationtimeMs;
  dynamic utcOffsetSeconds;
  String timezone;
  String timezoneAbbreviation;
  dynamic elevation;
  HourlyUnits hourlyUnits;
  Hourly hourly;

  HourlyWeather({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.hourlyUnits,
    required this.hourly,
  });

  // Factory method to create an instance from JSON
  factory HourlyWeather.fromJson(Map<String, dynamic> json) {
    return HourlyWeather(
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      generationtimeMs: json['generationtime_ms'].toDouble(),
      utcOffsetSeconds: json['utc_offset_seconds'],
      timezone: json['timezone'],
      timezoneAbbreviation: json['timezone_abbreviation'],
      elevation: json['elevation'],
      hourlyUnits: HourlyUnits.fromJson(json['hourly_units']),
      hourly: Hourly.fromJson(json['hourly']),
    );
  }
}

class Hourly {
  List<String> time;
  List<dynamic> temperature2M;
  List<dynamic> relativeHumidity2M;
  List<dynamic> precipitationProbability;
  List<dynamic> weatherCode;
  List<dynamic> surfacePressure;
  List<dynamic> cloudCover;
  List<dynamic> visibility;
  List<dynamic> windSpeed10M;

  Hourly({
    required this.time,
    required this.temperature2M,
    required this.relativeHumidity2M,
    required this.precipitationProbability,
    required this.weatherCode,
    required this.surfacePressure,
    required this.cloudCover,
    required this.visibility,
    required this.windSpeed10M,
  });

  // Factory method to create an instance from JSON
  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      time: List<String>.from(json['time']),
      temperature2M: List<dynamic>.from(json['temperature_2m'].map((x) => x.toDouble())),
      relativeHumidity2M: List<dynamic>.from(json['relative_humidity_2m']),
      precipitationProbability: List<dynamic>.from(json['precipitation_probability']),
      weatherCode: List<dynamic>.from(json['weather_code']),
      surfacePressure: List<dynamic>.from(json['surface_pressure'].map((x) => x.toDouble())),
      cloudCover: List<dynamic>.from(json['cloud_cover']),
      visibility: List<dynamic>.from(json['visibility']),
      windSpeed10M: List<dynamic>.from(json['wind_speed_10m'].map((x) => x.toDouble())),
    );
  }
}

class HourlyUnits {
  String time;
  String temperature2M;
  String relativeHumidity2M;
  String precipitationProbability;
  String weatherCode;
  String surfacePressure;
  String cloudCover;
  String visibility;
  String windSpeed10M;

  HourlyUnits({
    required this.time,
    required this.temperature2M,
    required this.relativeHumidity2M,
    required this.precipitationProbability,
    required this.weatherCode,
    required this.surfacePressure,
    required this.cloudCover,
    required this.visibility,
    required this.windSpeed10M,
  });

  // Factory method to create an instance from JSON
  factory HourlyUnits.fromJson(Map<String, dynamic> json) {
    return HourlyUnits(
      time: json['time'],
      temperature2M: json['temperature_2m'],
      relativeHumidity2M: json['relative_humidity_2m'],
      precipitationProbability: json['precipitation_probability'],
      weatherCode: json['weather_code'],
      surfacePressure: json['surface_pressure'],
      cloudCover: json['cloud_cover'],
      visibility: json['visibility'],
      windSpeed10M: json['wind_speed_10m'],
    );
  }
}

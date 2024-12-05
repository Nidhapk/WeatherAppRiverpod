class CurrentWeather {
  Request request;
  Location location;
  Current current;

  CurrentWeather({
    required this.request,
    required this.location,
    required this.current,
  });

  // fromJson method
  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      request: Request.fromJson(json['request']),
      location: Location.fromJson(json['location']),
      current: Current.fromJson(json['current']),
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
      'location': location.toJson(),
      'current': current.toJson(),
    };
  }
}

class Current {
  String observationTime;
  int temperature;
  int weatherCode;
  List<String> weatherIcons;
  List<String> weatherDescriptions;
  dynamic windSpeed;
  dynamic windDegree;
  String windDir;
  dynamic pressure;
  dynamic precip;
  dynamic humidity;
  dynamic cloudcover;
  dynamic feelslike;
  dynamic uvIndex;
  dynamic visibility;
  String isDay;

  Current({
    required this.observationTime,
    required this.temperature,
    required this.weatherCode,
    required this.weatherIcons,
    required this.weatherDescriptions,
    required this.windSpeed,
    required this.windDegree,
    required this.windDir,
    required this.pressure,
    required this.precip,
    required this.humidity,
    required this.cloudcover,
    required this.feelslike,
    required this.uvIndex,
    required this.visibility,
    required this.isDay,
  });

  // fromJson method
  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      observationTime: json['observation_time'],
      temperature: json['temperature'],
      weatherCode: json['weather_code'],
      weatherIcons: List<String>.from(json['weather_icons']),
      weatherDescriptions: List<String>.from(json['weather_descriptions']),
      windSpeed: json['wind_speed'],
      windDegree: json['wind_degree'],
      windDir: json['wind_dir'],
      pressure: json['pressure'],
      precip: json['precip'],
      humidity: json['humidity'],
      cloudcover: json['cloudcover'],
      feelslike: json['feelslike'],
      uvIndex: json['uv_index'],
      visibility: json['visibility'],
      isDay: json['is_day'],
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'observation_time': observationTime,
      'temperature': temperature,
      'weather_code': weatherCode,
      'weather_icons': weatherIcons,
      'weather_descriptions': weatherDescriptions,
      'wind_speed': windSpeed,
      'wind_degree': windDegree,
      'wind_dir': windDir,
      'pressure': pressure,
      'precip': precip,
      'humidity': humidity,
      'cloudcover': cloudcover,
      'feelslike': feelslike,
      'uv_index': uvIndex,
      'visibility': visibility,
      'is_day': isDay,
    };
  }
}

class Location {
  String name;
  String country;
  String region;
  String lat;
  String lon;
  String timezoneId;
  String localtime;
  int localtimeEpoch;
  String utcOffset;

  Location({
    required this.name,
    required this.country,
    required this.region,
    required this.lat,
    required this.lon,
    required this.timezoneId,
    required this.localtime,
    required this.localtimeEpoch,
    required this.utcOffset,
  });

  // fromJson method
  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      country: json['country'],
      region: json['region'],
      lat: json['lat'],
      lon: json['lon'],
      timezoneId: json['timezone_id'],
      localtime: json['localtime'],
      localtimeEpoch: json['localtime_epoch'],
      utcOffset: json['utc_offset'],
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'country': country,
      'region': region,
      'lat': lat,
      'lon': lon,
      'timezone_id': timezoneId,
      'localtime': localtime,
      'localtime_epoch': localtimeEpoch,
      'utc_offset': utcOffset,
    };
  }
}

class Request {
  String type;
  String query;
  String language;
  String unit;

  Request({
    required this.type,
    required this.query,
    required this.language,
    required this.unit,
  });

  // fromJson method
  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      type: json['type'],
      query: json['query'],
      language: json['language'],
      unit: json['unit'],
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'query': query,
      'language': language,
      'unit': unit,
    };
  }
}


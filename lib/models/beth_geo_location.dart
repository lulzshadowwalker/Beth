class BethGeoLocation {
  double? _latitude;
  double? _longitude;

  BethGeoLocation({double? latitude, double? longitude}) {
    _latitude = latitude;
    _longitude = longitude;
  }

  double? get latitude => _latitude;
  double? get longitude => _longitude;

  BethGeoLocation.fromJson(Map<String, dynamic> json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = _latitude;
    data['longitude'] = _longitude;
    return data;
  }

  @override
  String toString() =>
      'GeoLocation(_latitude: $_latitude, _longitude: $_longitude)';
}

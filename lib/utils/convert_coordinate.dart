String convertCoordinate(double latitude, double longitude) {
  String latitudeDirection = (latitude < 0) ? 'S' : 'N';
  String longitudeDirection = (longitude < 0) ? 'E' : 'W';

  // Ensure latitude and longitude are positive for calculations
  latitude = latitude.abs();
  longitude = longitude.abs();

  int latDegrees = latitude.floor();
  double latMinutesDecimal = (latitude - latDegrees) * 60;
  int latMinutes = latMinutesDecimal.floor();
  double latSeconds = (latMinutesDecimal - latMinutes) * 60;

  int lonDegrees = longitude.floor();
  double lonMinutesDecimal = (longitude - lonDegrees) * 60;
  int lonMinutes = lonMinutesDecimal.floor();
  double lonSeconds = (lonMinutesDecimal - lonMinutes) * 60;

  String dmsLatitude = '$latDegrees°${latMinutes.toString().padLeft(2, '0')}'
      '${latSeconds.toStringAsFixed(1)}"$latitudeDirection';
  String dmsLongitude = '$lonDegrees°${lonMinutes.toString().padLeft(2, '0')}'
      '${lonSeconds.toStringAsFixed(1)}"$longitudeDirection';

  return '$dmsLatitude $dmsLongitude';
}

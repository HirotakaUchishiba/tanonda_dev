import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

Future<LatLng> getLatLng(String address) async {
  var url = Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=AIzaSyBiztyBgf1Y9UvPR_zMWxuVBWQ35IpviDY');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);

    if (jsonResponse['results'] is List && jsonResponse['results'].length > 0) {
      var firstResult = jsonResponse['results'][0];

      if (firstResult['geometry'] is Map && firstResult['geometry']['location'] is Map) {
        var location = firstResult['geometry']['location'];
        return LatLng(location['lat'], location['lng']);
      }
    }
    throw Exception('No results for $address: $jsonResponse');
  } else {
    throw Exception('Failed to get location with status code ${response.statusCode}');
  }

  throw Exception('No results');
}

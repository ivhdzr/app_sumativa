import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/place.dart';

class PlacesViewModel extends ChangeNotifier {
  List<Place> _places = [];
  bool _isLoading = false;

  List<Place> get places => _places;
  bool get isLoading => _isLoading;

  Future<void> fetchPlaces(String query) async {
    _isLoading = true;
    notifyListeners();

    final apiKey = 'fsq3mcvkY66f+p7uNoOMoy6MO3n+yImj1QDCiYJ0gw5pjGg=';
    final url = Uri.parse(
        'https://api.foursquare.com/v3/places/search?query=$query&near=Mexico&fields=name,location,photos');

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': apiKey,
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['results'] != null) {
          _places = (data['results'] as List)
              .map((place) => Place.fromJson(place))
              .toList();
        } else {
          _places = [];
        }
      } else {
        throw Exception('Failed to load places');
      }
    } catch (error) {
      print("Error fetching places: $error");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/places_viewmodel.dart';
import '../models/place.dart';
import 'place_detail_view.dart';

class PlacesView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final placesViewModel = Provider.of<PlacesViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Lugares de México')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration:
                  InputDecoration(labelText: 'Buscar lugares de México'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                placesViewModel.fetchPlaces(_controller.text);
              },
              child: Text('Buscar'),
            ),
            SizedBox(height: 16.0),
            if (placesViewModel.isLoading) CircularProgressIndicator(),
            Expanded(
              child: ListView.builder(
                itemCount: placesViewModel.places.length,
                itemBuilder: (context, index) {
                  final place = placesViewModel.places[index];
                  return ListTile(
                    title: Text(place.name),
                    subtitle: Text('${place.address}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlaceDetailView(place: place),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

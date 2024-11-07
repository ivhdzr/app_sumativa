import 'package:flutter/material.dart';
import '../models/place.dart';

class PlaceDetailView extends StatelessWidget {
  final Place place;

  PlaceDetailView({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            place.photoUrl != null
                ? Image.network(
                    place.photoUrl!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: Text("Imagen no disponible",
                        style: TextStyle(fontSize: 18)),
                  ),
            SizedBox(height: 16),
            Text(
              place.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              place.address,
              style: TextStyle(fontSize: 16),
            ),

            // Puedes agregar más información aquí según tus necesidades
          ],
        ),
      ),
    );
  }
}

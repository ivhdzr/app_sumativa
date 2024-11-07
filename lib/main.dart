import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/places_view.dart';
import 'viewmodels/places_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlacesViewModel(),
      child: MaterialApp(
        title: 'Lugares de México',
        home: PlacesView(),
      ),
    );
  }
}

/*import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}*/

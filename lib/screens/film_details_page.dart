import 'package:flutter/material.dart';
import '../models/film.dart'; // Importez votre modèle de film ici

class FilmDetailsPage extends StatelessWidget {
  final Film film;

  FilmDetailsPage({required this.film});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(film.titre),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(film.description),
            SizedBox(height: 16),
            Text(
              'Notation:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('${film.notation} étoiles'),
          ],
        ),
      ),
    );
  }
}

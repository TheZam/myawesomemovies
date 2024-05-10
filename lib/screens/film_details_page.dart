import 'package:flutter/material.dart';
import '../models/film.dart'; // Importez votre modèle de film ici

class FilmDetailsPage extends StatelessWidget {
  final Film film;
  final Function(Film) onDelete;

  FilmDetailsPage({required this.film, required this.onDelete});

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
            Container(
              height: 350, // Hauteur spécifique pour l'image
              child: Image.network(
                film.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
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
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                onDelete(film);
                Navigator.pop(context);
              },
              child: Text('Supprimer ce film'),
            ),
          ],
        ),
      ),
    );
  }
}

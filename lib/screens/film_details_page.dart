import 'package:flutter/material.dart';
import '../models/film.dart';

class FilmDetailsPage extends StatelessWidget {
  final Film film;
  final Function(Film) onDelete;

  const FilmDetailsPage(
      {super.key, required this.film, required this.onDelete});

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
            SizedBox(
              height: 350,
              child: Image.network(
                film.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(film.description),
            const SizedBox(height: 16),
            const Text(
              'Notation:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('${film.notation} étoiles'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                onDelete(film);
                Navigator.pop(context);
              },
              child: const Text('Supprimer ce film'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_projects/db/database.dart';

class FilmDetailsPage extends StatelessWidget {
  final FilmData film;
  final Function(FilmData) onDelete;

  const FilmDetailsPage(
      {super.key, required this.film, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(film.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: MemoryImage(film.image!)))),
              const SizedBox(height: 16),
              const Text(
                'Titre:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(film.title),
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
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  onDelete(film);
                  Navigator.pop(context);
                },
                child: const Text('Supprimer ce film'),
              ),
            ],
          ),
        )
    );
  }
}

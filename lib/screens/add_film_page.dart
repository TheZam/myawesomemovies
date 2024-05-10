import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Importez Flutter Bloc
import 'package:flutter_projects/blocs/film_bloc.dart'; // Importez votre Cubit
import 'package:flutter_projects/models/film.dart';

class AddFilmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    double rating = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un Film'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Titre'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 16),
            Text('Notation:'),
            Slider(
              value: rating,
              min: 0,
              max: 5,
              divisions: 5,
              onChanged: (value) {
                rating = value;
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Créez un nouvel objet Film avec les détails saisis
                Film nouveauFilm = Film(
                  titre: titleController.text,
                  description: descriptionController.text,
                  notation: rating,
                );

                // Utilisez votre Cubit pour ajouter le film
                BlocProvider.of<FilmBloc>(context).addFilm(nouveauFilm);

                // Revenir à la page d'accueil après l'ajout
                Navigator.pop(context);
              },
              child: Text('Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}

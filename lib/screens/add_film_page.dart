import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Importez Flutter Bloc
import 'package:flutter_projects/blocs/film_bloc.dart'; // Importez votre Cubit
import 'package:flutter_projects/models/film.dart';

class AddFilmPage extends StatefulWidget {
  @override
  _AddFilmPageState createState() => _AddFilmPageState();
}

class _AddFilmPageState extends State<AddFilmPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageUrlController =
      TextEditingController(); // Contrôleur pour l'URL de l'image
  double rating = 0;

  @override
  Widget build(BuildContext context) {
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
              decoration: InputDecoration(labelText: 'Titre *'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description *'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: imageUrlController,
              decoration: InputDecoration(
                  hintText: 'ex : assets/images/3.jpg',
                  labelText:
                      'URL de l\'image, on est en local, donc mettre l\'image dans assets/images'), // Champ pour l'URL de l'image
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Notation: $rating',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Slider(
                    value: rating,
                    min: 0,
                    max: 5,
                    divisions: 5,
                    onChanged: (value) {
                      setState(() {
                        rating = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isEmpty ||
                    descriptionController.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Champs obligatoires'),
                        content: Text(
                            'Veuillez remplir tous les champs obligatoires.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  Film nouveauFilm = Film(
                    titre: titleController.text,
                    description: descriptionController.text,
                    notation: rating,
                    imageUrl:
                        imageUrlController.text, // Récupérez l'URL de l'image
                  );

                  BlocProvider.of<FilmCubit>(context).addFilm(nouveauFilm);

                  Navigator.pop(context);
                }
              },
              child: Text('Ajouter le film'),
            ),
          ],
        ),
      ),
    );
  }
}

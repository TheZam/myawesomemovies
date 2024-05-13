import 'dart:typed_data';

import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/blocs/film_cubit.dart';
import 'package:flutter_projects/db/database.dart';

class AddFilmPage extends StatefulWidget {
  @override
  _AddFilmPageState createState() => _AddFilmPageState();
}

class _AddFilmPageState extends State<AddFilmPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  double rating = 0;
  late Uint8List image;

  @override
  Widget build(BuildContext context) {
    final FilmCubit _filmBloc = BlocProvider.of<FilmCubit>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajouter un Film'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
              child: SizedBox(
            width: 600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 600,
                  child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: 'Titre *'),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: 600,
                  child: TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(labelText: 'Description *'),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: 600,
                  child: Row(
                    children: [
                      Text(
                        'Notation: $rating',
                        style: TextStyle(fontSize: 16),
                      ),
                      Slider(
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
                    ],
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                    child: ElevatedButton(
                  onPressed: () async {
                    FilePickerResult? result = await FilePickerWeb.platform
                        .pickFiles(
                            allowedExtensions: ['jpg', 'png', 'jpeg'],
                            type: FileType.custom);

                    if (result != null && result.files.first.bytes != null) {
                      Uint8List fileBytes = result.files.first.bytes!;
                      setState(() {
                        image = fileBytes;
                      });
                    }
                  },
                  child: Text("Sélectionner une image"),
                )),
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
                      FilmData nouveauFilm = FilmData(
                          id: 0,
                          title: titleController.text,
                          description: descriptionController.text,
                          notation: rating as int,
                          image: image);

                      _filmBloc.addFilm(nouveauFilm);

                      Navigator.pop(context);
                    }
                  },
                  child: Text('Ajouter le film'),
                ),
              ],
            ),
          )),
        ));
  }
}

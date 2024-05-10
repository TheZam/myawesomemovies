import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/blocs/film_bloc.dart';
import 'package:flutter_projects/models/film.dart';
import 'package:flutter_projects/screens/add_film_page.dart';
import 'package:flutter_projects/screens/film_details_page.dart'; // Importez la page de détails ici
import 'package:flutter_projects/theme/pp_colors.dart';

class HomePage extends StatelessWidget {
  late FilmBloc _filmBloc;

  @override
  Widget build(BuildContext context) {
    _filmBloc = BlocProvider.of<FilmBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: PpColors.green,
        title: Text('Ma Bibliothèque de Films'),
      ),
      body: BlocBuilder<FilmBloc, List<Film>>(
        builder: (context, films) {
          if (films.isEmpty) {
            return Center(
              child: Text('Aucun film n\'a été ajouté.'),
            );
          } else {
            return ListView.builder(
              itemCount: films.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Ouvrir la page de détails du film et passer la fonction onDelete
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FilmDetailsPage(
                          film: films[index],
                          onDelete: (Film film) {
                            _filmBloc.deleteFilm(film);
                          },
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Container(
                      height:
                          150, // Ajustez la hauteur souhaitée de chaque élément de la liste
                      child: Row(
                        children: [
                          SizedBox(
                            width:
                                120, // Spécifiez la largeur souhaitée de l'image
                            height: double
                                .infinity, // Utilisez la hauteur maximale disponible
                            child: Image.network(
                              films[index].imageUrl,
                              fit: BoxFit
                                  .cover, // Ajustez l'image pour couvrir la totalité du conteneur
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    films[index].titre,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  Expanded(
                                    child: Text(
                                      films[index].description,
                                      overflow: TextOverflow
                                          .ellipsis, // Gérer le débordement de texte si nécessaire
                                      maxLines:
                                          3, // Limiter le nombre maximum de lignes pour la description
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '${films[index].notation} étoiles',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: _filmBloc,
                child: AddFilmPage(),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/blocs/film_bloc.dart';
import 'package:flutter_projects/models/film.dart';
import 'package:flutter_projects/screens/add_film_page.dart';
import 'package:flutter_projects/screens/film_details_page.dart';
import 'package:flutter_projects/theme/pp_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final FilmCubit filmBloc = BlocProvider.of<FilmCubit>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: PpColors.green,
        title: const Text('Ma Bibliothèque de Films'),
      ),
      body: BlocBuilder<FilmCubit, List<Film>>(
        builder: (context, films) {
          if (films.isEmpty) {
            return const Center(
              child: Text('Aucun film n\'a été ajouté.'),
            );
          } else {
            return ListView.builder(
              itemCount: films.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FilmDetailsPage(
                          film: films[index],
                          onDelete: (Film film) {
                            filmBloc.deleteFilm(film);
                          },
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: SizedBox(
                      height: 150,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 120,
                            height: double.infinity,
                            child: Image.network(
                              films[index].imageUrl,
                              fit: BoxFit.cover,
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
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  Expanded(
                                    child: Text(
                                      films[index].description,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '${films[index].notation} étoiles',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
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
                value: filmBloc,
                child: AddFilmPage(),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

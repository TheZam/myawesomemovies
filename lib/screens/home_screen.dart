import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/blocs/film_cubit.dart';
import 'package:flutter_projects/blocs/film_state.dart';
import 'package:flutter_projects/db/database.dart';
import 'package:flutter_projects/screens/add_film_page.dart';
import 'package:flutter_projects/screens/film_details_page.dart';
import 'package:flutter_projects/theme/pp_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    FilmCubit _filmBloc = BlocProvider.of<FilmCubit>(context);
    // _filmBloc.deleteAll();
    _filmBloc.getFilms();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: PpColors.green,
        title: const Text('Ma Bibliothèque de Films'),
      ),
      body: BlocBuilder<FilmCubit, FilmState>(
        bloc: _filmBloc,
        builder: (context, state) {
          final films = state.films;

          if (films.isEmpty) {
            return const Center(
              child: Text('Aucun film n\'a été ajouté.'),
            );
          } else {
            return Expanded(
                child: ListView.builder(
                  itemCount: films.length,
                  itemBuilder: (context, index) {
                    final film = films[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FilmDetailsPage(
                              film: film,
                              onDelete: (FilmData film) {
                                _filmBloc.deleteFilm(film.id);
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
                              Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: MemoryImage(film.image!)))),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        film.title,
                                        style: const TextStyle(
                                            fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 8),
                                      Expanded(
                                        child: Text(
                                          film.description,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        '${film.notation} étoiles',
                                        style: const TextStyle(fontWeight: FontWeight.bold),
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
                ));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
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
        child: const Icon(Icons.add),
      ),
    );
  }
}

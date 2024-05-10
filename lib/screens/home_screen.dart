import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/blocs/film_bloc.dart';
import 'package:flutter_projects/models/film.dart';
import 'package:flutter_projects/screens/add_film_page.dart';
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
                    // Naviguer vers la page de détails du film lorsque l'utilisateur appuie sur un film
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(films[index].titre),
                      subtitle: Text(films[index].description),
                      trailing: Text('${films[index].notation} étoiles'),
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

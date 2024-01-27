import 'package:flutter/material.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:animate_do/animate_do.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMoviesCallback searchMovies;

  SearchMovieDelegate({required this.searchMovies});

  @override
  String get searchFieldLabel => "Pesquisar filmes";

  @override
  List<Widget>? buildActions(BuildContext context) {
    // return [const Text("buildActions")];
    // print("query: $query");
    return [
      // if (query.isNotEmpty)
      FadeIn(
          animate: query.isNotEmpty,
          duration: const Duration(milliseconds: 200),
          child: IconButton(
              onPressed: () => query = "", icon: const Icon(Icons.clear)))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // return const Text("buildLeading");
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back_ios_new_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("buildResults");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // return const Text("buildSuggestions");
    return FutureBuilder(
      future: searchMovies(query),
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return ListTile(
              title: Text(movie.title),
            );
          },
        );
      },
    );
  }
}

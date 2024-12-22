import 'package:flutter/material.dart';
import 'package:movie_web4_lec/model/movie_model.dart';

class NowPlayingMovie extends StatelessWidget {
  final List<MovieModel> nowPlayingMovies;
  const NowPlayingMovie({super.key, required this.nowPlayingMovies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: nowPlayingMovies.length,
        itemBuilder: (context, index) {
          final movie = nowPlayingMovies[index];
          return ListTile(
            onTap: () {},
            leading: Image.network(
              'https://image.tmdb.org/t/p/w500/${movie.backdropPath}',
              width: 80,
              height: 120,
              fit: BoxFit.cover,
            ),
            title: Text(
              movie.title,
              style: const TextStyle(color: Colors.amber),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              movie.overview,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          );
        });
  }
}

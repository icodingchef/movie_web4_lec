import 'package:flutter/material.dart';
import 'package:movie_web4_lec/model/movie_model.dart';

class MovieGridView extends StatefulWidget {
  final List<MovieModel> popularMovie;
  const MovieGridView({super.key, required this.popularMovie});

  @override
  State<MovieGridView> createState() => _MovieGridViewState();
}

class _MovieGridViewState extends State<MovieGridView> {
  int? hoverIndex;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, childAspectRatio: 0.8),
      itemCount: widget.popularMovie.length,
      itemBuilder: (context, index) {
        final movie = widget.popularMovie[index];
        return MouseRegion(
          onEnter: (event) {},
          onExit: (event) {},
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: hoverIndex == index
                ? (Matrix4.identity()
                  ..scale(1.05, 1.05)
                  ..translate(0, -10))
                : Matrix4.identity(),
            child: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  elevation: hoverIndex == index ? 20 : 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.all(8),
                          children: [
                            Text(
                              movie.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text(movie.voteAverage.toString())
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Text('Language: ${movie.originalLanguage}')
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text('Adult: ${movie.adult ? 'Yes' : 'No'}')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

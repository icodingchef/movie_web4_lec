import 'package:flutter/material.dart';
import 'package:movie_web4_lec/data/movie_data.dart';
import 'package:movie_web4_lec/model/movie_model.dart';
import 'package:movie_web4_lec/skeleton_loading/carousel_skeleton.dart';
import 'package:movie_web4_lec/skeleton_loading/now_skeleton.dart';
import 'package:movie_web4_lec/skeleton_loading/popular_skeleton.dart';
import 'package:movie_web4_lec/widget/footer.dart';
import 'package:movie_web4_lec/widget/icon_searchbar.dart';
import 'package:movie_web4_lec/widget/main_drawer.dart';
import 'package:movie_web4_lec/widget/main_widget/main_carousel_slider.dart';
import 'package:movie_web4_lec/widget/main_widget/main_now_playing.dart';
import 'package:movie_web4_lec/widget/main_widget/main_popular_movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieModel> _topratedMovie = [];
  List<MovieModel> _nowPlayMovie = [];
  List<MovieModel> _popularMovie = [];
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getMovieData();
    });
  }

  getMovieData() async {
    var data = MovieData();
    _topratedMovie = await data.fetchTopRatedMovie();
    _nowPlayMovie = await data.fetchNowPlayingMovie();
    _popularMovie = await data.fetchPopularMovie();
    setState(() {
      isLoading = false;
    });
    print(_topratedMovie[0].originalTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const IconSerachbar(),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Top rated movies",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: isLoading
                        ? const CarouselSkeleton()
                        : MainCarouselSlider(topratedMoives: _topratedMovie),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Text(
                          "Now playing",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        height: 470,
                        child: isLoading
                            ? const NowSkeleton()
                            : NowPlayingMovie(nowPlayingMovies: _nowPlayMovie),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Text(
                "Explore popular movies",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: isLoading
                  ? LayoutBuilder(
                      builder: (context, constraints) {
                        double gridviewHight =
                            (constraints.maxWidth / 5) * 1.3 * 4;
                        return SizedBox(
                          height: gridviewHight,
                          child: const PopularSkeleton(),
                        );
                      },
                    )
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        double gridviewHight = (constraints.maxWidth / 5) *
                            1.3 *
                            (_popularMovie.length) /
                            5;
                        return SizedBox(
                          height: gridviewHight,
                          child: MovieGridView(popularMovie: _popularMovie),
                        );
                      },
                    ),
            ),
            const Footer()
          ],
        ),
      ),
    );
  }
}

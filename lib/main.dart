import 'package:flutter/material.dart';
import 'package:movies_app/utils/text.dart';
import 'package:movies_app/widgets/toprated.dart';
import 'package:movies_app/widgets/trending.dart';
import 'package:movies_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topRatedMovies = [];
  List tv = [];

  final String apikey = '6d611c5c35ffc46f4960097ffc109d58';

  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZDYxMWM1YzM1ZmZjNDZmNDk2MDA5N2ZmYzEwOWQ1OCIsInN1YiI6IjYxYjBmYmMyOTA0ZjZkMDAxZTVkNjAxNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PuAsLs-xaAA6119TMHh8wcT-4lF9uqgUeNHs9i-MZDI';
  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map trendingresults = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresults = await tmdbWithCustomLogs.v3.tv.getPouplar();
    print(tvresults);
    // setState(() {
    //   trendingmovies = trendingresults['results'];
    //   topRatedMovies = topratedresults['results'];
    //   tv = tvresults['result'];
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: modified_text(
          text: 'Movie App❤️',
          color: Colors.white,
          size: 15,
        )),
        body: ListView(children: [
          TV(Tv: tv),
          TopRated(toprated: topRatedMovies),
          TrendingMovies(trending: trendingmovies)
        ]));
  }
}

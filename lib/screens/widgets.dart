import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../modal_class/credits.dart';
import '../modal_class/function.dart';
import '../modal_class/movie.dart';
import '../screens/cast.dart';
import '../screens/movie_detail.dart';


class ScrollingMovies extends StatefulWidget {
  final ThemeData themeData;
  final String api, title;
  ScrollingMovies({this.themeData, this.api, this.title});
  @override
  _ScrollingMoviesState createState() => _ScrollingMoviesState();
}

class _ScrollingMoviesState extends State<ScrollingMovies> {
  List<Movie> moviesList;
  @override
  void initState() {
    super.initState();
    fetchMovies(widget.api).then((value) {
      setState(() {
        moviesList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.title,
                  style: widget.themeData.textTheme.headline5),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          height: 600,
          child: moviesList == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: moviesList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetailPage(
                                      movie: moviesList[index],
                                      themeData: widget.themeData,
                                      heroId:
                                          '${moviesList[index].id}${widget.title}')));
                        },
                        child: Hero(
                          tag: '${moviesList[index].id}${widget.title}',
                          child: SizedBox(
                            width: 380,
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: FadeInImage(
                                      image: NetworkImage(TMDB_BASE_IMAGE_URL +
                                          'w500/' +
                                          moviesList[index].posterPath),
                                      fit: BoxFit.cover,
                                      placeholder: AssetImage(
                                          'assets/images/loading.gif'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    moviesList[index].title,
                                    style: widget.themeData.textTheme.bodyText1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class ScrollingArtists extends StatefulWidget {
  final ThemeData themeData;
  final String api, title, tapButtonText;
  final Function(Cast) onTap;
  ScrollingArtists(
      {this.themeData, this.api, this.title, this.tapButtonText, this.onTap});
  @override
  _ScrollingArtistsState createState() => _ScrollingArtistsState();
}

class _ScrollingArtistsState extends State<ScrollingArtists> {
  Credits credits;
  @override
  void initState() {
    super.initState();
    fetchCredits(widget.api).then((value) {
      setState(() {
        credits = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        credits == null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text(widget.title,
                        style: widget.themeData.textTheme.bodyText1),
                  ],
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.title,
                        style: widget.themeData.textTheme.bodyText1),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CastAndCrew(
                                    themeData: widget.themeData,
                                    credits: credits,
                                  )));
                    },
                    child: Text(widget.tapButtonText,
                        style: widget.themeData.textTheme.caption),
                  ),
                ],
              ),
        SizedBox(
          width: double.infinity,
          height: 120,
          child: credits == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: credits.cast.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          widget.onTap(credits.cast[index]);
                        },
                        child: SizedBox(
                          width: 80,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: SizedBox(
                                  width: 70,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child:
                                        credits.cast[index].profilePath == null
                                            ? Image.asset(
                                                'assets/images/na.png',
                                                fit: BoxFit.cover,
                                              )
                                            : FadeInImage(
                                                image: NetworkImage(
                                                    TMDB_BASE_IMAGE_URL +
                                                        'w500/' +
                                                        credits.cast[index]
                                                            .profilePath),
                                                fit: BoxFit.cover,
                                                placeholder: AssetImage(
                                                    'assets/images/loading.gif'),
                                              ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  credits.cast[index].name,
                                  style: widget.themeData.textTheme.caption,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

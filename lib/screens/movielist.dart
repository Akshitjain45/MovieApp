import 'package:flutter/material.dart';
import '../api/endpoints.dart';
import '../screens/widgets.dart';
import '../theme/utils.dart';
import 'package:provider/provider.dart';

class Movielist extends StatelessWidget {
  Movielist({@required this.year});
  final String year;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ThemeState>(context);
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Movies',
          style: state.themeData.textTheme.headline5,
        ),
        backgroundColor: state.themeData.primaryColor,
      ),
      body: Container(
        color: state.themeData.primaryColor,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            ScrollingMovies(
              themeData: state.themeData,
              title: 'Popular',
              api: Endpoints.popularitybyear(1, int.parse(year)
              ),
            ),
          ],
        ),
      ),
    );
  }
}

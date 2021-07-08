import 'package:flutter/material.dart';

import 'screens/movielist.dart';
import 'theme/utils.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeState>(
      create: (_) => ThemeState(),
      child: MaterialApp(
        title: 'Movies',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue, canvasColor: Colors.transparent),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final yearController = TextEditingController();
    final state = Provider.of<ThemeState>(context);

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Enter Year',
            style: state.themeData.textTheme.headline5,
          ),
          backgroundColor: state.themeData.primaryColor,
        ),
        backgroundColor: Color(0xffdfdded),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20, top: 100),
                  child: TextField(
                    controller: yearController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Year',
                      hintText: 'Enter Any Year',
                      labelStyle: TextStyle(
                          fontFamily: ('Roboto'),
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 24),
                      hintStyle: TextStyle(
                          fontFamily: ('Roboto'),
                          color: Colors.black,
                          fontSize: 20),
                      helperStyle: TextStyle(
                          fontFamily: ('Roboto'),
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    int year = int.parse(yearController.text);
                    if (year <= DateTime.now().year && year>1500) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Movielist(year: yearController.text)),
                      );
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                content: Text("NO MOVIES!!"),
                              ));
                    }
                  },
                  color: state.themeData.primaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Get Movies',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}  










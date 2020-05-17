import 'dart:math';

import 'package:flutter/material.dart';

import 'models/pokemon.dart';
import 'services/pokemon_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Pokédex'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<Pokemon> futurePokemon;

  void _fetchNewData() {
    setState(() {

      futurePokemon = PokemonService.fetchPokemon(Random().nextInt(200));
      //developer.log('data: $futureAlbum');
    });
  }

  @override
  void initState() {
    super.initState();
    // Fetch some data when the app is first loaded
    _fetchNewData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Container(
                width: 300,
                height: 300,
                child: FutureBuilder<Pokemon>(
                  future: futurePokemon,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      //return Text(snapshot.data.toString());
                      return Column(
                          children: <Widget>[
                            Text(snapshot.data.name),
                            Text('#' + snapshot.data.id.toString()),
                            Image.network(snapshot.data.sprite.front_default),
                          ]
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                ),
            ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchNewData,
        tooltip: 'Fetch',
        child: Icon(Icons.refresh),
      ),
    );
  }
}






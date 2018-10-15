import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ZOOMBOX'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://i.imgur.com/BoN9kdC.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.more_vert),
          )
        ],
      ),
      body: new ListView(
        children: <Widget>[

          new Container(
            decoration: new BoxDecoration(color: Theme
                .of(context)
                .primaryColor),
            child: new TabBar(
              controller: _controller,
              tabs: [
                new Tab(
                  text: 'Most Visited',
                ),
                new Tab(
                  text: 'Bookmarks',
                ),
                new Tab(
                  text: 'History',
                )
              ], indicatorColor: Colors.orange,
            ),
          ),
          new Container(
            height: 100.0,
            child: new TabBarView(
              controller: _controller,
              children: <Widget>[
                new Card(
                  child: new ListTile(
                    leading: const Icon(Icons.search),
                    title: new TextField(
                      decoration: const InputDecoration(
                          hintText: 'Search for address...'),
                    ),
                  ),
                ),
                new Card(
                  child: new ListTile(
                    leading: const Icon(Icons.location_on),
                    title: new Text('Latitude: 48.09342\nLongitude: 11.23403'),
                    trailing: new IconButton(
                        icon: const Icon(Icons.my_location), onPressed: () {}),
                  ),

                ),
                new Card(
                  child: new Text('Mahfuz')

                ),
              ],
            ),
          ),

          new RaisedButton(
            color: Theme
                .of(context)
                .primaryColor,
            onPressed: () {},
            child: const Text(
              'Make free Audio/Video calls & Chat with your friend',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
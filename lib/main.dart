import 'package:flutter/material.dart';
import 'package:responsive_app/layout/navbar.dart';
import 'package:responsive_app/layout/app.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Open Sans',
        ),
      ),
      home: HomeView(),
    );
  }
}

class BodyContentLg extends StatelessWidget {
  const BodyContentLg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: <Widget>[
          AppBody(),
          Expanded(
            child: Center(
              child: ActionButton('Start'),
            ),
          )
        ],
      ),
    );
  }
}

class BodyContentSm extends StatelessWidget {
  const BodyContentSm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AppBody(),
          SizedBox(height: 100),
          ActionButton('Start'),
        ],
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 31, 229, 146),
              ),
              child: Center(
                child: Text(
                  'Responsive App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: ContentView(
        child: Column(
          children: <Widget>[
            Navbar(),
            Expanded(
              child: ScreenTypeLayout.builder(
                mobile: (BuildContext context) => BodyContentSm(),
                tablet: (BuildContext context) => BodyContentSm(),
                desktop: (BuildContext context) => BodyContentLg(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:alert/profileSettings.dart';
import 'package:flutter/material.dart';

import 'notificationBottomsheet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EvacuAid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'EvacuAid'),
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile()
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: Container(
              color: Colors.grey[100],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'You have pushed the button this many times:',
                      ),
                    ],
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.notifications),
        onPressed: () {
          buildBottomSheet(context);
          },
      ),
    );
  }

  void buildBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            height: MediaQuery.of(context).size.height
                - kToolbarHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    height: 8,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    )
                ),
                Container(
                  height: 50,
                ),
                Text(
                  "Notifications",
                  style: TextStyle(fontSize: 20, fontFamily: "Raleway"),
                ),
                Expanded(
                  child: DraggableScrollableSheet(
                      initialChildSize: 1.0,
                      minChildSize: 1.0,
                      builder: (BuildContext context, ScrollController scrollController) {
                        return NotificationBottomSheet(scrollController);
                      }
                  ),
                ),
              ],
            ),
          )
        );
      },
      isScrollControlled: true,
    );
  }
}
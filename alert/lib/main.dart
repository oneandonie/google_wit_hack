import 'dart:async';

import 'package:alert/profileSettings.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();
  bool _isHelpButtonDisabled = false;

  static final CameraPosition _kKurnell = CameraPosition(
    target: LatLng(-34.012244, 151.228151),
    zoom: 15.4746,
  );

  Widget _buildMap() {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      child: GoogleMap(
        initialCameraPosition: _kKurnell,
      ),
    );
  }

  Widget _buildHelpButton(BuildContext context) {
    return Stack(
            children: <Widget>[
              Positioned(
                child: RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  shape: CircleBorder(),
                  fillColor: Colors.grey.withOpacity(0.5),
                  padding:EdgeInsets.all(130),
                ),
              ),
              Positioned(
                bottom: 20,
                child: RawMaterialButton(
                  onLongPress: () {
                    setState(() {
                      _isHelpButtonDisabled = true;
                    });
                    final snackBar = SnackBar(
                      content: Text("Alerting Emergency Services..."),
                      action: SnackBarAction(
                        label: "UNDO",
                        onPressed: () {
                          setState(() => _isHelpButtonDisabled = false);
                        },
                      ),
                    );
                    _scaffoldKey.currentState.showSnackBar(snackBar);
                  },
                  enableFeedback: true,
                  elevation: 2.0,
                  shape: CircleBorder(),
                  fillColor: Colors.red.withOpacity(0.9),
                  padding: EdgeInsets.all(90),
                  child: Text(
                    "HELP",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.red.withOpacity(0.9),
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle,
              size: 40,
            ),
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
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 100,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height - 100,
                      child: GoogleMap(
                        initialCameraPosition: _kKurnell,
                      ),
                    ),
                    Visibility(
                      visible: _isHelpButtonDisabled ? false : true,
                      child: Positioned(
                        bottom: 80,
                        child: _buildHelpButton(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red.withOpacity(0.9),
        child: Icon(Icons.notifications),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                  return Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    height: MediaQuery.of(context).size.height
                        - kToolbarHeight,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
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
                );
              },
              isScrollControlled: true,
              );
          },
      ),
    );
  }
}
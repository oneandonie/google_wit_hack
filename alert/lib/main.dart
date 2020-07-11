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
  Set<Marker> _markers = Set<Marker>();

  static final CameraPosition _randomStartPos = CameraPosition(
    target: LatLng(-33.874863, 150.970239),
    zoom: 11.0
  );

  static final LatLng _startLatLng = LatLng(-29.395797, 153.234807);
  static final CameraPosition _startPos = CameraPosition(
      target: _startLatLng,
      zoom: 15.0,
  );

  static final LatLng _destLatLng = LatLng(-29.388767, 153.230752);
  static final CameraPosition _destPos = CameraPosition(
    target: _destLatLng,
    zoom: 16.0,
  );

  Set<Marker> _createMarkers() {
    return <Marker>[
      Marker(
        markerId: MarkerId("start_marker"),
        position: _startLatLng,
        infoWindow: InfoWindow(
          title: 'Your Location',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
      Marker(
        markerId: MarkerId("dest_marker"),
        position: _destLatLng,
        infoWindow: InfoWindow(
          title: 'Destination',
          snippet: 'Chatswood Island Public School',
        ),
        icon: BitmapDescriptor.defaultMarker,
      )
    ].toSet();
  }

  Widget _buildMap() {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      child: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        zoomGesturesEnabled: true,
        myLocationEnabled: true,
        initialCameraPosition: _randomStartPos,
        markers: _markers,
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
                  onLongPress: () async {
                    setState(() {
                      _isHelpButtonDisabled = true;
                      _markers = _createMarkers();
                    });
                    final snackBar = SnackBar(
                      content: Text("Alerting Emergency Services..."),
                      action: SnackBarAction(
                        label: "UNDO",
                        onPressed: () {
                          setState(() {
                            _isHelpButtonDisabled = false;
                            _markers.clear();
                          });
                        },
                      ),
                    );
                    _scaffoldKey.currentState.showSnackBar(snackBar);
                    final controller = await _controller.future;
                    controller.animateCamera(CameraUpdate.newCameraPosition(_startPos));
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
      body: Stack(
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
                      child: _buildMap(),
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
      floatingActionButton: FloatingActionButton(
            tooltip: 'notifications',
            backgroundColor: Colors.red.withOpacity(0.9),
            child: Icon(Icons.notifications),
            onPressed: () {
              buildBottomSheet(context);
            },
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Raleway",
                  ),
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
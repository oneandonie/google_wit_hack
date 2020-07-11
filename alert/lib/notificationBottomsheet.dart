import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class NotificationBottomSheet extends StatefulWidget {
  NotificationBottomSheet({this.title}) : super();
  
  final String title;

  @override
  _NotificationBottomSheet createState() => _NotificationBottomSheet();
}

class _NotificationBottomSheet extends State<NotificationBottomSheet> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue
    );
  }
}
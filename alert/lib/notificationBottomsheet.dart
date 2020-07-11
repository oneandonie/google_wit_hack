import 'package:flutter/material.dart';

import 'notification.dart';


class NotificationBottomSheet extends StatefulWidget {

  @override
  _NotificationBottomSheet createState() => _NotificationBottomSheet();
}

class _NotificationBottomSheet extends State<NotificationBottomSheet> {

  List<AlertNotification> notifications;

  @override
  void initState() {
    super.initState();
    notifications = List<AlertNotification>();
    notifications.addAll([
      AlertNotification("test title0", "test desc0", DateTime.now()),
      AlertNotification("test title1", "test desc1", DateTime.now()),
      AlertNotification("test title2", "test desc2", DateTime.now())
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 160,
    );
  }
}
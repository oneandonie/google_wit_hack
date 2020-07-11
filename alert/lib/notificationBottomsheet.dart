
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
      color: Colors.amber,
      height: 160,
      child: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          AlertNotification notif = notifications[index];
          return Container(
            color: Colors.white,
            child: ListTile(
                title: Text(notif.title),
                subtitle: Text(notif.description),
                leading: Text(notif.timeAdded.toString()),
            ),
          );
        }
      )
    );
  }
}
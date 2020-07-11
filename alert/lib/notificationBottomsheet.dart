
import 'package:flutter/material.dart';

import 'notification.dart';


class NotificationBottomSheet extends StatefulWidget {

  NotificationBottomSheet(this._scrollController);

  ScrollController _scrollController;

  @override
  _NotificationBottomSheet createState() =>
      _NotificationBottomSheet(_scrollController);
}

class _NotificationBottomSheet extends State<NotificationBottomSheet> {

  List<AlertNotification> notifications;
  ScrollController _scrollController;

  _NotificationBottomSheet(this._scrollController);

  @override
  void initState() {
    super.initState();
    notifications = List<AlertNotification>();
    notifications.addAll([
      AlertNotification("Wind Warnings for Saturday 11 July",
          "Cancellation for the following areas: Torres Strait, "
              "Peninsula Coast and Cooktown Coast",
          DateTime(
            2020, 7, 11, 15, 30
          )),
      AlertNotification("Wind Warnings for Sunday 12 July",
          "Strong Wind Warnings for the following areas: "
              "South East Gulf of Carpentaria",
          DateTime(
            2020, 7, 11, 15, 50
          )),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: ListView.separated(
        controller: _scrollController,
        padding: EdgeInsets.all(16),
        itemCount: notifications.length,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 12.0,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          AlertNotification notif = notifications[index];
          return Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: ListTile(
              title: Text(notif.title.toString()),
              subtitle: Text(notif.description.toString()),
              leading: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(notif.timeAdded.day.toString()
                        + "-" + notif.timeAdded.month.toString()
                        + "-" + notif.timeAdded.year.toString()),
                    Text(notif.timeAdded.hour.toString()
                        + ":" + notif.timeAdded.minute.toString()),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


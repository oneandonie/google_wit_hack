import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EvacuAid'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("../images/asian_male.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      )
    );
  }

}
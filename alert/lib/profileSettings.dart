import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  bool _isEditMode;

  @override
  void initState() {
    super.initState();
    _isEditMode = false;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.withOpacity(0.9),
        title: Text('EvacuAid'),
        actions: [
          _isEditMode ? IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              setState(() => _isEditMode = false );
            }
          ): IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              setState(() => _isEditMode = true );
            }
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              overflow: Overflow.visible,
              children: <Widget>[
                Image(
                  excludeFromSemantics: true,
                  height: MediaQuery.of(context).size.height / 4,
                  fit: BoxFit.cover,
                  image: AssetImage("../images/pano_mountain_bg.jpeg"),
                ),
                Positioned(
                  bottom: -80.0,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("../images/asian_male.jpg"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 95.0,
            ),
            Center(
              child: Text(
                "James Wu",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            _buildAddressAndDOB(),
            SizedBox(height:10),
            _buildMedicalRequirements(),
            _buildEmergencyContacts(context),
            _buildEmergencyInformation(),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyInformation() {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.chrome_reader_mode,
                ),
                SizedBox(width: 10),
                Text(
                  "Emergency Information",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Medicare No: 1234 5678"),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Text("Centrelink No: 1234 5678"),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Text("Tax File No: 1234 5678"),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    Text("License No: 1234 5678"),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Text("Car Registration: ABC 123"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildEmergencyContacts(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.contact_phone,
                ),
                SizedBox(width: 10),
                Text(
                  "Emergency Contacts",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 5),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("../images/successful_man.jpg"),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Sel Leena",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                              "Relationship: Carer"
                          ),
                          Text("Phone: 9512 1234"),
                          Text("Address: Fairview Clinic"),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("../images/young_female.jpg"),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Jessie Wu",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                              "Relationship: Sister"
                          ),
                          Text("Phone: 0412 345 678"),
                          Text("Address: 123 Smith Ave"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicalRequirements() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.local_hospital,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Medical Information",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Text(
                    "Condition: ",
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                    "Paraplegic",
                  overflow: TextOverflow.fade,
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Text(
                    "Accessibility: ",
                ),
                Expanded(
                  child: Text(
                    "Stretcher Evacuation",
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Text("Medication: "),
                Text("N/A"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressAndDOB() {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.black.withOpacity(0.6),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              "Unit 1/A 123 Chicken Road Farm 2130 NSW",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(width: 10),
          VerticalDivider(
            color: Colors.black,
          ),
          SizedBox(width: 10,),
          Icon(
            Icons.calendar_today,
            size: 30,
            color: Colors.black.withOpacity(0.6),
          ),
          SizedBox(width: 5),
          Expanded(
            child:Text(
              "29 February 1988",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
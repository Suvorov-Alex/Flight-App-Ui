import 'package:flight_app_ui/WaveShapeCilpper.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Flight App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: appTheme,
    ));

Color startColor = Color(0xFF81D4FA);
Color endColor = Color(0xFF7FC4F7);

ThemeData appTheme = ThemeData(primaryColor: startColor, fontFamily: 'Oxygen');

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[HomeScreenTopPart()],
      ),
    );
  }
}

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

List<String> locations = ['Saratov (SAR)', 'Samara (SAM)'];

TextStyle dropDownLabelStyle = TextStyle(color: Colors.white, fontSize: 16.0);
TextStyle dropDownMenuItemStyle =
    TextStyle(color: Colors.black, fontSize: 16.0);

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  var selectedLocationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: WaveShapeClipper(),
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [startColor, endColor])),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 4.0, 0.0, 0.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      PopupMenuButton(
                          onSelected: (index) {
                            setState(() {
                              selectedLocationIndex = index;
                            });
                          },
                          child: Row(
                            children: <Widget>[
                              Text(locations[selectedLocationIndex],
                                  style: dropDownLabelStyle),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              )
                            ],
                          ),
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuItem<int>>[
                                PopupMenuItem(
                                  child: Text(
                                    locations[0],
                                    style: dropDownMenuItemStyle,
                                  ),
                                  value: 0,
                                ),
                                PopupMenuItem(
                                  child: Text(
                                    locations[1],
                                    style: dropDownMenuItemStyle,
                                  ),
                                  value: 1,
                                ),
                              ]),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          0.0,
                          0.0,
                          16.0,
                          0.0,
                        ),
                        child: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

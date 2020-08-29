import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//for complete code https://github.com/m-hamzashakeel/NavigationRail_widget/blob/master/lib/main.dart
class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Rails"),
      ),
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedLabelTextStyle: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
            groupAlignment: 0.0,
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: <NavigationRailDestination>[
              NavigationRailDestination(
                icon: SizedBox.shrink(),
                // selectedIcon: Icon(Icons.favorite),
                label: Row(
                  children: <Widget>[
                    RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        "Favourite",
                        textScaleFactor: 1.5,
                      ),
                    ),
                    Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
              NavigationRailDestination(
                icon: SizedBox.shrink(),
                //selectedIcon: Icon(Icons.bookmark),
                label: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    "bookmark",
                    textScaleFactor: 1.5,
                  ),
                ),
              ),
              NavigationRailDestination(
                icon: SizedBox.shrink(),
                // selectedIcon: Icon(Icons.star),
                label: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      "star",
                      textScaleFactor: 1.5,
                    )),
              ),
            ],
            selectedIndex: _selectedIndex,
          ),
          VerticalDivider(
            width: 1,
            thickness: 1,
          ),
          Expanded(
            child: Center(
                child: Text(
              "selected $_selectedIndex",
              textScaleFactor: 2.0,
            )),
          )
        ],
      ),
    );
  }
}
